class BorrowBook < ApplicationRecord
  belongs_to :borrow
  has_one :book, dependent: :destroy
end
