class Paycheck < ApplicationRecord
  belongs_to :payroll
  belongs_to :employee
end
