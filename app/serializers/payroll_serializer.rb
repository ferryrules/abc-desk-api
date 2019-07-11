class PayrollSerializer < ActiveModel::Serializer
  attributes :id, :payroll_status, :start_date, :end_date, :check_date, :cash_req, :to_currency, :total_hours

    belongs_to :company

    has_many :paychecks
    has_many :paycheck_adjustments, through: :paychecks
    has_many :employees, through: :paychecks

    def to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
      "#{pre_symbol}#{
        ( "%.2f" % self.object.cash_req ).gsub(
          /(\d)(?=(?:\d{3})+(?:$|\.))/,
          "\\1#{thousands}"
        )
      }#{post_symbol}"
    end

    def total_hours
      total = 0
      self.object.paychecks.each do |pc|
        total += pc.hours + pc.ot_hours + pc.pto_hours + pc.vacation_hours + pc.holiday_hours + pc.sick_hours
      end
      total
    end

end
