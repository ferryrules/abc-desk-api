class PaycheckSerializer < ActiveModel::Serializer
  attributes :id, :hours, :ot_hours, :pto_hours, :vacation_hours, :holiday_hours, :sick_hours, :payroll_id, :emp_name, :emp_pay_type, :emp_pay_rate

    belongs_to :payroll
    belongs_to :employee

    has_many :paycheck_adjustments

    def emp_name
      self.object.employee.full_name
    end

    def emp_pay_type
      self.object.employee.pay_type
    end

    def emp_pay_rate
      self.object.employee.to_currency
    end

end
