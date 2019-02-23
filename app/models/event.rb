class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances
  scope :past, -> { Event.all.select { |e| e.date < Time.now } }
  scope :upcoming, -> { Event.all.select { |e| e.date > Time.now } }

  # def Event.past
  #   now = Time.now
  #   Event.all.select { |e| e.date < now }
  # end

  # def Event.upcoming
  #   now = Time.now
  #   Event.all.select { |e| e.date > now }
  # end
end
