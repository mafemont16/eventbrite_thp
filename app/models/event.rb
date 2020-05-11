class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :admin, class_name: 'User'

  validates :start_date, :duration, :title, :description, :price, :location, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 140 }
  validates :description, presence: true, length: {minimum: 20, maximum: 1000 }
  validates :price,
            presence: true,
            numericality: {greater_than: 0, less_than_or_equal_to: 1000}, multiple: true
  validates :location, presence: true
end
