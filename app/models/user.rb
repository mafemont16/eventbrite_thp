class User < ApplicationRecord

  #after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


            has_many :guest_participations, foreign_key: 'guest_id', class_name: "Participation"
            has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

            has_many :events, through: :participations
            has_many :participations
            has_many :events, foreign_key: 'author_id', class_name: 'Event'

  def welcome_send
      UserMailer.welcome_email(self).deliver_now
  end
end
