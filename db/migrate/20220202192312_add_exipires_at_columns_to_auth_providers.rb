class AddExipiresAtColumnsToAuthProviders < ActiveRecord::Migration[7.0]
  def change
    add_column :authentication_providers, :expires_at, :integer
  end
end
