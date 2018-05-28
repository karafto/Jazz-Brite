class User < ApplicationRecord
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances
  has_many :events, foreign_key: :creator_id, class_name: "Event"

  validates :name, presence: true,
                       length: { minimum: 2 },
                       uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:name]
end
