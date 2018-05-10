class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :search, ->(search_item){where "name LIKE ?", "%#{search_item}%"}
  scope :search_by_created_at, ->{order created_at: :DESC}
end
