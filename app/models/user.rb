class User < ApplicationRecord

  belongs_to :company

  has_many :tickets, through: :company

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

end
