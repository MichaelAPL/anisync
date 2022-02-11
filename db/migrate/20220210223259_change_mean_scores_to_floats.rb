class ChangeMeanScoresToFloats < ActiveRecord::Migration[7.0]
  def change
    change_column :animes, :mal_mean_score, :float
    change_column :animes, :anilist_mean_score, :float
  end
end
