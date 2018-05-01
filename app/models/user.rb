class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :borrows, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :name, presence: true, length: Settings.maximum_name
  validates :email, presence: true, length: Settings.maximum_email,
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: Settings.maximum_password
  validates :phone_number, presence: true, length: Settings.maximum_phone_num
  validates :address, :create_date, presence: true
  enum role: {admin: 0, user: 1}
end
