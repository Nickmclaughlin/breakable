class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :sent_posts, class_name: "Post", foreign_key: 'poster_id'
  has_many :received_posts, class_name: "Post", foreign_key: 'recipient_id'
  has_many :photos

  has_many :sent_responses, class_name: "Response", foreign_key: 'poster_id'
  has_many :received_responses, class_name: "Response", foreign_key: 'recipient_id'

  has_many :sent_nudges, class_name: "Nudge", foreign_key: 'nudger_id'
  has_many :received_nudges, class_name: "Nudge", foreign_key: 'recipient_id'

  validates :sex, presence: true
  validates :zip, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  geocoded_by :last_sign_in_ip
  after_validation :geocode, :if => :last_sign_in_ip_changed?


  STATES = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
  AGE = [18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28 , 29, 40, 31, 32, 33, 34, 35, 36, 37, 38 , 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 60, 51, 52, 53, 54, 55, 56, 57, 58 ,59, 60, 61, 62, 63, 64, 65, 66, 67, 68 ,69]

  def self.search(search)
    if search.present?
      where("interests ilike :q", q: "%#{search}%")
    else
      self.all
    end
  end

  def self.search_location(search)
    if search.present?
      @users = User.near("%#{search}%", 50)
    else
      self.all
    end
  end

  def nudged(user)
    votes.where(recipient_id: user.nudge.recipient_id)
  end

  def admin?
    admin == true
  end
end
