class Category < ApplicationRecord
    has_many :activities, dependant: :destroy
    validates :name, presence: true, uniqueness: true
end
