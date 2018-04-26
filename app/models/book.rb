class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy
end
