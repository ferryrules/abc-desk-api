class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name, :high, :medium, :low, :open, :pending, :closed, :check_dates_with_total_hours, :active, :terminated, :hourly, :salary

  has_many :departments
  has_many :payrolls
  has_many :tickets

  has_many :comp_users
  has_many :users, through: :comp_users

  has_many :employees
  # has_many :employees, through: :departments

  def active
    Employee.all.filter do |emp|
      emp.active_status == 'Active'
    end
  end

  def terminated
    Employee.all.filter do |emp|
      emp.active_status == 'Terminated'
    end
  end

  def hourly
    Employee.all.filter do |emp|
      emp.pay_type == 'Hourly'
    end
  end

  def salary
    Employee.all.filter do |emp|
      emp.pay_type == 'Salary'
    end
  end

  def high
    Ticket.all.filter do |ticket|
      ticket.priority == 'High'
    end
  end

  def medium
    Ticket.all.filter do |ticket|
      ticket.priority == 'Medium'
    end
  end

  def low
    Ticket.all.filter do |ticket|
      ticket.priority == 'Low'
    end
  end

  def open
    Ticket.all.filter do |ticket|
      ticket.ticket_status == 'Open'
    end
  end

  def pending
    Ticket.all.filter do |ticket|
      ticket.ticket_status == 'Pending'
    end
  end

  def closed
    Ticket.all.filter do |ticket|
      ticket.ticket_status == 'Closed'
    end
  end

  def check_dates_with_total_hours
    Payroll.all.map do |payr|
      [payr.check_date, total_hours(payr.paychecks)]
    end
  end

  def total_hours(paychecks)
    total = 0
    paychecks.each do |pc|
      total += pc.hours + pc.ot_hours + pc.pto_hours + pc.vacation_hours + pc.holiday_hours + pc.sick_hours
    end
    total
  end

end
