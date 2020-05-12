class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :admin, class_name: 'User'

  validates :start_date,
            presence: true

  validates :duration_is_multiple_of_5_and_is_positive

  validates :title,
            presence: true,
            length: {minimum: 5, maximum: 140 }

  validates :description,
            presence: true,
            length: {minimum: 20, maximum: 1000, message: 'Please type a descriptions with more than 2 characters and less than 1000' }

  validates :price,
            presence: true,
            format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
            numericality: {greater_than: 0, less_than_or_equal_to: 1000}

  validates :location,
             presence: true
end
