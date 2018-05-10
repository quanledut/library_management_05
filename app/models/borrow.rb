class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_books, dependent: :destroy
  validates :borrow_date, presence: true
  enum status: {waitting: 0, accept: 1, cancel: 2, reject: 3}
end
