class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :likes
  has_many :follows
end
