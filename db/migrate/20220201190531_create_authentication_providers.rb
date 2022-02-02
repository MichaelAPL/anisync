class CreateAuthenticationProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :authentication_providers do |t|
      t.string :provider_name
      t.string :uid
      t.string :user_name
      t.string :access_token
      t.string :refresh_token
      t.boolean :is_primary

      t.belongs_to :user, index: true
    
      t.timestamps
    end
  end
end
