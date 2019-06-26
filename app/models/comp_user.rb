class CompUser < ApplicationRecord

  belongs_to :company

  has_many :tickets
  has_many :users, through: :company
end
