class Post < ApplicationRecord
  enum posts_visibility_method: { post_public: 0, post_unlisted: 1, post_private:2 }
end
