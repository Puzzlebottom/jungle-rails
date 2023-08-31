class User < ApplicationRecord
  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  before_save :downcase_email

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    return unless user&.authenticate(password)

    user
  end

  def downcase_email
    email.downcase!
  end
end
