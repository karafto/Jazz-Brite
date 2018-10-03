class Invite < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_one :recipient, class_name: 'User'
  validates :recipient_email, presence: true, format: { with: Devise.email_regexp }
end