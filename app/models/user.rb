class User < ApplicationRecord

  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         #validates :email,
         #           uniqueness: true,
         #           format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'please enter a valid email address' },
         #           presence: true,
         #           length: { maximum: 256 }
         #
         # validates :encrypted_password,
         #           presence: true
         #
         # validates :description,
         #           presence: true,
         #           length: { in: 10..500 }
         #
         # validates :first_name,
         #           presence: true,
         #           length: { in: 2..30 }
         #
         # validates :last_name,
         #           presence: true,
         #           length: { in: 2..30 }


            has_many :events, through: :participations
            has_many :participations
            has_many :events, foreign_key: 'admin_id', class_name: 'Event'

            def welcome_send
              UserMailer.welcome_email(self).deliver_now
            end
end
