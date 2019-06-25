class PaycheckSerializer < ActiveModel::Serializer
  attributes :id, :hours, :ot_hours, :pto_hours, :vacation_hours, :holiday_hours, :sick_hours
  has_one :payroll
  has_one :employee
end
