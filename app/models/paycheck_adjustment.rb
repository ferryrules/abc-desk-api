class PaycheckAdjustment < ApplicationRecord

  belongs_to :paycheck
  belongs_to :employee
  
end
