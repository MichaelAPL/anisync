class CreateListEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :list_entries do |t|
      t.belongs_to :user
      t.belongs_to :anime

      t.string :status
      t.integer :episodes_seen
      t.integer :score
      t.date :started_at
      t.date :finished_at
            
      t.timestamps
    end
  end
end
