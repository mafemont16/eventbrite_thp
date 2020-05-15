class Participation < ApplicationRecord

  #after_create :new_participant_send

  belongs_to :guest, class_name: "User"
  belongs_to :event
  validates :guest_id, uniqueness: { scope: [:event_id] }

  def new_participant_send
    AdminMailer.new_participant(self).deliver_now
  end

end
