class User < ApplicationRecord

  #after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         #validates :email,
         #           uniqueness: true,
         #           presence: true,
         #
         # validates :encrypted_password,
         #           presence: true
         #
         # validates :description,
         #           presence: true,
         #
         # validates :first_name,
         #           presence: true,
         #
         # validates :last_name,
         #           presence: true,


            has_many :events, through: :participations
            has_many :participations
            has_many :events, foreign_key: 'author_id', class_name: 'Event'

            def welcome_send
              UserMailer.welcome_email(self).deliver_now
            end
end
