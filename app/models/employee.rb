class Employee < ApplicationRecord

  belongs_to :company
  belongs_to :department, optional: true

  has_many :departments
  has_many :recurring_adjustments

  has_many :paychecks
  has_many :paycheck_adjustments, through: :paychecks
  has_many :payrolls, through: :paychecks

  validates :full_name, presence: true

  def weekly_pay_rate
    self.pay_rate / 52
  end

  def to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
    "#{pre_symbol}#{
      ( "%.2f" % self.weekly_pay_rate ).gsub(
        /(\d)(?=(?:\d{3})+(?:$|\.))/,
        "\\1#{thousands}"
      )
    }#{post_symbol}"
  end

end
