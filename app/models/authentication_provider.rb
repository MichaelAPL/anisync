class AuthenticationProvider < ApplicationRecord
  belongs_to :user

  def parsed_name
    self.provider_name.camelize
  end
end
