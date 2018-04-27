class Author < ApplicationRecord
  has_many :books
  has_many :likes
  has_many :follows
end
