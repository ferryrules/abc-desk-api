class Paycheck < ApplicationRecord

  belongs_to :payroll
  belongs_to :employee

  has_many :paycheck_adjustments
  
end
