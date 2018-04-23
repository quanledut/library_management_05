class Borrow < ApplicationRecord
  belongs_to :user
  validates :borrow_date, :status, presence: true
end
