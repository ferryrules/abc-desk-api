class PayrollSerializer < ActiveModel::Serializer
  attributes :id, :payroll_status, :start_date, :end_date, :check_date

    belongs_to :company

    has_many :paychecks
    has_many :paycheck_adjustments, through: :paychecks
    has_many :employees, through: :paychecks

end
