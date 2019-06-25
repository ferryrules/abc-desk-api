class Ticket < ApplicationRecord

  belongs_to :user
  belongs_to :company

  has_many :users, through: :company
  
end
