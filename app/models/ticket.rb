class Ticket < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :comp_user, optional: true
  belongs_to :company

  has_many :comp_users, through: :company
  has_many :users, through: :company

end
