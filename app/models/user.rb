class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          validates :name, presence: true

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  
  end

  has_many :posts
  #has_many :post_comments, dependent: :destroy
  #has_many :bookmarks, dependent: :destroy

  # フォローしているユーザーとのアクティブなリレーションシップ
  #has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # フォローされているユーザーとのパッシブなリレーションシップ
  #has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローしているユーザーとの関連付け
  #has_many :following, through: :active_relationships, source: :followed
  # フォローされているユーザーとの関連付け
  #has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :user_image
end

