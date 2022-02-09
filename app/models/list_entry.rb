class ListEntry < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :anime_id, uniqueness: { scope: :user_id, message: "only one ocurrance of an anime entry per user list" }

  STATUSES = [:watching, :completed, :on_hold, :dropped, :plan_to_watch]
end
