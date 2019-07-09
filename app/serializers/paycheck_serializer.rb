class PaycheckSerializer < ActiveModel::Serializer
  attributes :id, :hours, :ot_hours, :pto_hours, :vacation_hours, :holiday_hours, :sick_hours, :payroll_id

    belongs_to :payroll
    belongs_to :employee

    has_many :paycheck_adjustments

end
