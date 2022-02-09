class CreateAnimes < ActiveRecord::Migration[7.0]
  def change
    create_table :animes do |t|
      t.integer :mal_id
      t.integer :anilist_id
      t.string :name
      t.text :other_names
      t.text :synopsis
      t.string :studios
      t.integer :aired_at_year
      t.string :emmision_status
      t.string :image_url
      t.text :streaming_urls
      t.text :mal_raw
      t.text :anilist_raw

      t.timestamps
    end
  end
end
