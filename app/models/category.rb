class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.search search_item
    where(["name LIKE ?", "%#{search_item}%"])
  end
end
