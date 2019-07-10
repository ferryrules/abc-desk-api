class EmployeeSerializer < ActiveModel::Serializer

  attributes :id, :full_name, :pay_type, :pay_rate, :active_status, :filing_status, :w4_allowance, :title, :pay_rate

  belongs_to :company

  has_many :departments
  has_many :recurring_adjustments

  has_many :paychecks
  has_many :payrolls, through: :paychecks
  has_many :paycheck_adjustments, through: :paychecks

  def to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
    "#{pre_symbol}#{
      ( "%.2f" % self.pay_rate ).gsub(
        /(\d)(?=(?:\d{3})+(?:$|\.))/,
        "\\1#{thousands}"
      )
    }#{post_symbol}"
  end

end
