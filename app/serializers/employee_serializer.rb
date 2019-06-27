class EmployeeSerializer < ActiveModel::Serializer

  attributes :id, :full_name, :pay_type, :pay_rate, :active_status, :filing_status, :w4_allowance

  belongs_to :company

  has_many :departments
  has_many :recurring_adjustments

  has_many :paychecks
  has_many :paycheck_adjustments, through: :paychecks

end
