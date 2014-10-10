class Post < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :recipient, class_name: "User"
  paginates_per 10

  validates :message, presence: true
  validates :poster_id, presence: true
  validates :recipient_id, presence: true
end
