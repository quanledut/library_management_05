class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy
end
