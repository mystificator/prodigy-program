class ScheduledActivity < ApplicationRecord
  belongs_to :schedule
  belongs_to :activity

  validates :activity, uniqueness: { scope: :schedule_id }
end
