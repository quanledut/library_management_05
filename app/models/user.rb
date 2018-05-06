class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token

  has_many :borrows, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.maximum_name}
  validates :password, presence: true,
    length: {maximum: Settings.maximum_password}
  validates :phone_number, presence: true,
    length: {maximum: Settings.maximum_phone_num}
  validates :address, :create_date, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {maximum: Settings.maximum_password}
  validates :phone_number, presence: true,
    length: {maximum: Settings.maximum_phone_num}
  validates :address, :create_date, presence: true
  has_secure_password

  enum role: {admin: 0, user: 1}

  def remember
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
    save(validates: false)
  end

  def forget
    self.remember_digest = nil
    save(validates: false)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
