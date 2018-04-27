class Like < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :author
end
