class RemoveStreamingUrlsFromAnimes < ActiveRecord::Migration[7.0]
  def change
    remove_column :animes, :streaming_urls
  end
end
