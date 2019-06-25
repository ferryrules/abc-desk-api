class PayrollSerializer < ActiveModel::Serializer
  attributes :id, :payroll_status, :start_date, :end_date, :check_date
  has_one :company
end
