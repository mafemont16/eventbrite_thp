class User < ApplicationRecord

    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end

    has_many :events, through: :participations
    has_many :participations
    has_many :events, foreign_key: 'admin_id', class_name: 'Event'

  validates :email,
            presence: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid address" }

  validates :encrypted_password,
            presence: true,
            length: { minimum: 6 }

  validates :description,
            presence: true,
            length: { in: 10..500 }

  validates :first_name,
            presence: true,
            length: { in: 2..30 }

  validates :last_name,
            presence: true,
            length: { in: 2..30 }



end
