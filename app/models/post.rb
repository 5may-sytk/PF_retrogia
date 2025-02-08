class Post < ApplicationRecord
  has_one_attached :post_image

  belongs_to :user
  #belongs_to :event
  has_many :bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags

  enum posts_visibility_range: { post_public: 0, post_unlisted: 1, post_private:2 }
end
