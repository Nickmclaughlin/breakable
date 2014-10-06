class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :posts

  validates :sex, presence: true

  def self.search(search)
    if search.present?
      where("username like ?", "%#{search}%")
    else
      self.all
    end
  end
end
