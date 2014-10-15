class Nudge < ActiveRecord::Base
  belongs_to :nudger, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
