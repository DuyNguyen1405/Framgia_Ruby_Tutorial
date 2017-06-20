class User < ApplicationRecord

  before_save :downcase

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.name_max_length}
  validates :password, presence: true,
    length: {minimum: Settings.password_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email_max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password

  private

  def downcase
    self.email = email.downcase
  end

end
