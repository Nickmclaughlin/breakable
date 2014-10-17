class Nudge < ActiveRecord::Base
  belongs_to :nudger, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :nudger_id, presence: true
  validates :recipient_id, presence: true
end
