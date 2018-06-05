class Event < ApplicationRecord
  belongs_to :user
  has_many :passive_rsvps, class_name: 'Attend', foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :passive_rsvps, source: :attendee

  validates :description, presence: true
  validates :title, presence: true
  validates :location, presence: true

  def self.upcoming
    self.where("date >= ?", Time.now).order("date ASC")
  end

  def self.past
    self.where("date < ?", Time.now).order("date DESC")
  end

end