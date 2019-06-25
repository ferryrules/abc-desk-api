class Payroll < ApplicationRecord

  belongs_to :company

  has_many :paychecks
  has_many :paycheck_adjustments, through: :paychecks
  has_many :employees, through: :paychecks

end
