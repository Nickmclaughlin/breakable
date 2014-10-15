class Response < ActiveRecord::Base
  belongs_to :poster, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :post

  validates :body, presence: true
  validates :poster_id, presence: true
  validates :recipient_id, presence: true
end
