class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :likes, dependent: :destroy, foreign_key: :liked_id, inverse_of: :book
  has_many :follows, dependent: :destroy, foreign_key: :followed_id, inverse_of: :book

  validates_presence_of :name
  validates_numericality_of :price

  accepts_nested_attributes_for :author

  def self.search search_item
    where(["name LIKE ?", "%#{search_item}%"])
  end
end
