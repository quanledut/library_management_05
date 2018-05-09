class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy, foreign_key: :liked_id, inverse_of: :author
  has_many :follows, dependent: :destroy, foreign_key: :followed_id, inverse_of: :author
end
