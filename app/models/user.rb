class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end

    has_many :events, through: :participations
    has_many :participations
    has_many :events, foreign_key: 'admin_id', class_name: 'Event'

  validates :email,
            presence: true

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
