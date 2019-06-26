class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :company

  has_many :tickets, through: :company


end
