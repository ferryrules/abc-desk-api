class Employee < ApplicationRecord

  belongs_to :company

  has_many :departments
  has_many :recurring_adjustments

  has_many :paychecks
  has_many :paycheck_adjustments, through: :paychecks
  has_many :payrolls, through: :paychecks

  validates :full_name, presence: true

  def to_currency(pre_symbol='$', thousands=',', decimal='.',post_symbol=nil)
    "#{pre_symbol}#{
      ( "%.2f" % self.pay_rate ).gsub(
        /(\d)(?=(?:\d{3})+(?:$|\.))/,
        "\\1#{thousands}"
      )
    }#{post_symbol}"
  end

end
