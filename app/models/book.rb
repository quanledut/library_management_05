class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :borrow_books, dependent: :destroy
  has_many :likes, dependent: :destroy, foreign_key: :liked_id, inverse_of: :book
  has_many :follows, dependent: :destroy, foreign_key: :followed_id, inverse_of: :book
  validates :name, presence: true
  validates :price, numericality: true

  accepts_nested_attributes_for :author

  scope :search, ->(search_item){where "name LIKE ?", "%#{search_item}%"}
  scope :search_by_created_at, ->{order created_at: :DESC}
end
