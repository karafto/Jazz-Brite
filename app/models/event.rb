class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :description, presence: true
end