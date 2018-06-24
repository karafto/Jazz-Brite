class Event < ApplicationRecord
  belongs_to :user
  has_many :passive_rsvps, class_name: 'Attend', foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :passive_rsvps, source: :attendee
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validate  :picture_size

  def self.upcoming
    self.where("date >= ?", Time.zone.now).order("date ASC")
  end

  def self.past
    self.where("date < ?", Time.zone.now).order("date DESC")
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end