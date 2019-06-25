class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :pay_type, :pay_rate, :active_status, :filing_status, :w4_allowances
  has_one :company
end
