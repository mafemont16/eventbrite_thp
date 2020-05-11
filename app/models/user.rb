class User < ApplicationRecord
    has_many :events, through: :participations
    has_many :participations
    has_many :events, foreign_key: 'admin_id', class_name: 'Event'

    private

      def welcome_send
        UserMailer.welcome_email(self).deliver_now
      end

end
