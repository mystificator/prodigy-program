class UserActivityProgress < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :schedule

  validates :activity, uniqueness: { scope: [:user_id, :schedule_id] }
end
