class BorrowBook < ApplicationRecord
  belongs_to :borrow
  belongs_to :cart
  has_one :book, dependent: :destroy
end
