class Anime < ApplicationRecord
  has_many :list_entries
  has_many :user, through: :list_entries

  validates :mal_id, uniqueness: true
end
