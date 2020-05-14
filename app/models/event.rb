class Event < ApplicationRecord

#after_create :participate_event_send

#def participate_event_send
  #UserMailer.participate_event_email(self).deliver_now
#end

  has_many :participations
  has_many :users, through: :participations
  belongs_to :author, class_name: 'User'

  validates :start_date, presence: true

  validates :duration, presence: true

  validates :title,
             presence: true,
             length: {minimum: 2, maximum: 140 }

  validates :description,
             presence: true,
             length: {minimum: 5, maximum: 1000 }

  validates :price,
             presence: true,
             numericality: {greater_than: 0, less_than_or_equal_to: 1000}

  validates :location, presence: true

private

def duration_is_multiple_of_5_and_is_positive
  duration >= 0 && duration % 5 == 0 ? true : false
end

end
