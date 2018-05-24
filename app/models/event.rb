class Event < ApplicationRecord
  belongs_to :user
  #:creator, class_name: "User"
  validates :description, presence: true
end