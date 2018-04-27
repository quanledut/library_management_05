class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_book
  validates :borrow_date, :status, presence: true
end
