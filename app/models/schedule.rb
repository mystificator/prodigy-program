class Schedule < ApplicationRecord
    has_many :scheduled_activities, dependent: :destroy
    has_many :activities, through: :scheduled_activities
    
    validates :day, presence: true, uniqueness: true
    validates :day, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30 }
end
