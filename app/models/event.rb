class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  scope :past_events, -> { where('starting < ?', Date.today) }
  scope :future_events, -> { where('starting > ?', Date.today) }
end
