class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy

  # validates :name, presence: :true
end
