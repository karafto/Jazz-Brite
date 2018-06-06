class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :active_rsvps, foreign_key: 'attendee_id', class_name: 'Attend', dependent: :destroy
  has_many :attended_events, through: :active_rsvps, source: :attended_event

  validates :name, presence: true,
                       length: { minimum: 2 },
                       uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:name]

  def attend(event)
    active_rsvps.create(attended_event_id: event.id)
  end

  def unattend(event)
    active_rsvps.find_by(attended_event_id: event.id).destroy
  end
  
  def upcoming_events
    attended_events.where("date >= ?", Time.now).order("date ASC")
  end

  def past_events
    attended_events.where("date < ?", Time.now).order("date DESC")
  end

  def attending?(event)
    attended_events.include?(event)
  end
end
