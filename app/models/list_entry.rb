class ListEntry < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :anime_id, uniqueness: { scope: :user_id, message: "only one ocurrance of an anime entry per user list" }

  STATUSES = [:watching, :completed, :on_hold, :dropped, :plan_to_watch]

  def completion_percentage
    return 100 if self.status == "completed"
    return 50 if self.status == "watching" && self.anime.total_episodes == 0
    return 0 if self.status == "plan_to_watch"
    ((self.episodes_seen * 100) / self.anime.total_episodes)
  end
end
