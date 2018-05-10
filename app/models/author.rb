class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy, foreign_key: :liked_id, inverse_of: :author
  has_many :follows, dependent: :destroy, foreign_key: :followed_id, inverse_of: :author

  scope :search, ->(search_item){where "name LIKE ?", "%#{search_item}%"}
  scope :search_by_created_at, ->{order created_at: :DESC}
end
