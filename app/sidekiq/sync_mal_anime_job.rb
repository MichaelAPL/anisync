class SyncMalAnimeJob
  include Sidekiq::Job

  #sidekiq_options retry: false

  def perform(access_token, refresh_token, user_id)
    authenticated_user = RubyMalClient::AuthenticatedUser.new
    authenticated_user.access_token = access_token
    authenticated_user.refresh_token = refresh_token

    anime_client = RubyMalClient::Anime.new

    params = {sort: "anime_title", limit: 1000, fields: "list_status"}

    response = authenticated_user.my_anime_list(params: params)
    animes = response[:data]
    paging = response[:paging]

    anime_list_ids = []
    animes.each { |anime| anime_list_ids.push(anime[:node][:id]) }
    
    db_animes = Anime.select(:mal_id)    
    db_anime_ids = []
    db_animes.each { |anime| db_anime_ids.push(anime.mal_id) }

    missing_anime_ids = anime_list_ids - db_anime_ids

    # Add the missing animes into the DB so we can create the list entry
    if !missing_anime_ids.empty?
      missing_anime_ids.each do |id|
        anime_details = anime_client.find(id)
        anime_record = create_anime_db_record(anime_details)
      end    
    end

    # Then, create the list entries
    anime_list_ids.each do |id|
      anime_record = Anime.where(mal_id: id).first
      anime_list_fields = animes.find { |anime| anime[:node][:id] == id }
      create_list_entry_db_record(user_id, anime_record, anime_list_fields)
    end
  end 
  
  def create_anime_db_record(anime_details)    
    anime_record = Anime.find_or_create_by(mal_id: anime_details[:id])
    #anime_record.mal_id = anime_details[:id]
    anime_record.name = anime_details[:title]

    other_names = ""
    anime_details[:alternative_titles][:synonyms].each do |synonim|
      other_names += "#{synonim},"
    end
    other_names += "#{anime_details[:alternative_titles][:en]},"
    other_names += "#{anime_details[:alternative_titles][:ja]}"
    anime_record.other_names = other_names    

    studios = ""
    anime_details[:studios].each {|studio| studios += "#{studio[:name]}, " }
    anime_record.studios = studios
    
    anime_record.synopsis = anime_details[:synopsis]
    anime_record.aired_at_year = !anime_details[:start_season].nil? ? anime_details[:start_season][:year] : nil
    anime_record.emmision_status = anime_details[:status]
    anime_record.image_url = anime_details[:main_picture][:medium]
    anime_record.mal_mean_score = anime_details[:mean]
    anime_record.mal_raw = anime_details.to_json

    anime_record.save
  end

  def create_list_entry_db_record(user_id, anime_record, anime_list_fields)
    list_entry = ListEntry.find_or_create_by(user_id: user_id, anime_id: anime_record.id)
    list_entry.status = anime_list_fields[:list_status][:status]
    list_entry.episodes_seen = anime_list_fields[:list_status][:num_episodes_watched]
    list_entry.score = anime_list_fields[:list_status][:score]
    list_entry.started_at = anime_list_fields[:list_status][:start_date].nil? ? nil :  anime_list_fields[:list_status][:start_date].to_date
    list_entry.finished_at = anime_list_fields[:list_status][:finish_date].nil? ? nil : anime_list_fields[:list_status][:finish_date].to_date

    if list_entry.valid?
      list_entry.save
    end    
  end
end
