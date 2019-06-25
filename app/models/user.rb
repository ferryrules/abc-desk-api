class User < ApplicationRecord

  belongs_to :company

  has_many :tickets, through: :company
  
end
