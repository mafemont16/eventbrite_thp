class Event < ApplicationRecord

#after_create :participate_event_send

def participate_event_send
  UserMailer.participate_event_email(self).deliver_now
end

  has_many :participations
  has_many :guests, class_name: 'User', through: :participations
  belongs_to :admin, class_name: 'User'

  validates :start_date, presence: true
  validate :start_date_must_be_future

  validates :duration, presence: true

  validates :title,
             presence: true,
             length: { in: 2..140 }

  validates :description,
             presence: true,
             length: {in: 10..1000 }

  validates :price,
             presence: true,
             inclusion: { in: 1..1000}

  validates :location, presence: true


def start_date_must_be_future
  return unless start_date
  errors.add(:start_date, "is not correct") unless start_date > Time.now
end

end
