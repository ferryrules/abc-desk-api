class Employee < ApplicationRecord

  belongs_to :company

  has_many :departments
  has_many :recurring_adjustments

  has_many :paychecks
  has_many :paycheck_adjustments, through: :paychecks

  validates :full_name, presence: true

end
