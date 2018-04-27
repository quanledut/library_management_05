class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :borrows
  has_many :likes
  has_many :follows
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 200},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates_inclusion_of :role, :in => 0..1
  validates :phone_number, presence: true, length: {maximum: 13}
  validates :address, :create_date, presence: true
end
