class Activity < ApplicationRecord
  belongs_to :category

  has_many :scheduled_activities, dependent: :destroy
  has_many :schedules, through: :scheduled_activities
  has_many :user_activity_progresses, dependent: :destroy
  
  validates :name, :frequency, :duration, presence: true
end
