class Photo < ActiveRecord::Base
  belongs_to :user
  paginates_per 10

  def verify(user_id)
    if Photo.where(profile_photo: true, user_id: user_id.to_i).count  > 1
      true
    else
      false
    end
  end

  validates :photo, presence: true
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader
end
