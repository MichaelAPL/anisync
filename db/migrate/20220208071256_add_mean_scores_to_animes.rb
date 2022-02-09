class AddMeanScoresToAnimes < ActiveRecord::Migration[7.0]
  def change
    add_column :animes, :mal_mean_score, :integer
    add_column :animes, :anilist_mean_score, :integer
  end
end
