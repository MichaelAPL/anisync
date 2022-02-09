class User < ApplicationRecord
  has_many :authentication_providers
  has_many :list_entries
  has_many :anime, through: :list_entries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
  
  attr_writer :login
  validate :validate_username  

  def login
    @login || self.username || self.email
  end  

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: username).exists? || username.empty?
      errors.add(:username, :invalid)
    end
  end

  def main_provider
    self.authentication_providers.find { |provider| provider.is_primary } 
  end

  def anime_list
    anime_list = []
    ListEntry::STATUSES.each do |status|
      entries_with_status = self.list_entries.select { |entry| entry.status == status.to_s}      
      anime_list.push({ status => entries_with_status })
    end
    anime_list
  end
end
