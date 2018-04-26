class Cart < ApplicationRecord
  has_many :borrow_books, dependent: :destroy
  has_many :books, dependent: :destroy
end
