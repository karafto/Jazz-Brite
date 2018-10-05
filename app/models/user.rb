class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :active_rsvps, foreign_key: 'attendee_id', class_name: 'Attend', dependent: :destroy
  has_many :attended_events, through: :active_rsvps, source: :attended_event
  has_many :sent_invitations, class_name: 'Invite', foreign_key: 'sender_id'
  validates :name, presence: true,
                     length: { minimum: 2, maximum: 50 },
                     uniqueness: true
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, authentication_keys: [:name]
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  def attend(event)
    active_rsvps.create(attended_event_id: event.id)
  end

  def unattend(event)
    active_rsvps.find_by(attended_event_id: event.id).destroy
  end
  
  def upcoming_events
    attended_events.where("date >= ?", Time.zone.now).order("date ASC")
  end

  def past_events
    attended_events.where("date < ?", Time.zone.now).order("date DESC")
  end

  def attending?(event)
    attended_events.include?(event)
  end
end
