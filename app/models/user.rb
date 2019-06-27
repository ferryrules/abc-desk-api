class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :companies, optional: true
  has_many :tickets

  has_many :tickets, through: :companies

  attr_accessor :password

  def authenticate(plaintext_password)
    if BCrypt::Password.create(self.password_digest) == plaintext_password
      self
    else
      false
    end
  end

end
