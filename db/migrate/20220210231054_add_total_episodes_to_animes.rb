class AddTotalEpisodesToAnimes < ActiveRecord::Migration[7.0]
  def change
    add_column :animes, :total_episodes, :integer
  end
end
