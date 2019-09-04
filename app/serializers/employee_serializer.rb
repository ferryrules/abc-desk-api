class EmployeeSerializer < ActiveModel::Serializer

  attributes :id, :fname, :lname, :full_name, :pay_type, :pay_rate, :active_status, :filing_status, :w4_allowance, :title, :to_currency, :weekly_to_currency

  belongs_to :company
  # belongs_to :department, optional: true

  has_many :recurring_adjustments

  has_many :paychecks
  has_many :payrolls, through: :paychecks
  has_many :paycheck_adjustments, through: :paychecks

  def weekly_pay_rate
    self.object.pay_rate / 52
  end

  def weekly_to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
    "#{pre_symbol}#{
      ( "%.2f" % self.weekly_pay_rate ).gsub(
        /(\d)(?=(?:\d{3})+(?:$|\.))/,
        "\\1#{thousands}"
      )
    }#{post_symbol}"
  end

  def to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
    "#{pre_symbol}#{
      ( "%.2f" % self.object.pay_rate ).gsub(
        /(\d)(?=(?:\d{3})+(?:$|\.))/,
        "\\1#{thousands}"
      )
    }#{post_symbol}"
  end

  def full_name
    self.object.fname + ' ' + self.object.lname
  end

end
