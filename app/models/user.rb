class User < ApplicationRecord
  has_many :created_events, dependent: :destroy, foreign_key: :creator_id, class_name: "Event"
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances

  def previous_events
    now = Time.now
    attended_events.select { |e| e.date < now }
  end

  def upcoming_events
    now = Time.now
    attended_events.select { |e| e.date >= now }
  end
end
