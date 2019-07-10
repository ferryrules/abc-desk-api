class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name, :high, :medium, :low, :open, :pending, :closed, :all_check_dates, :active, :terminated, :hourly, :salary

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
    Employee.all.each do |emp|
      emp.active_status == 'Terminated'
    end
  end

  def hourly
    Employee.all.each do |emp|
      emp.pay_type == 'Hourly'
    end
  end

  def salary
    Employee.all.each do |emp|
      emp.pay_type == 'Salary'
    end
  end

  def high
    Ticket.all.each do |ticket|
      ticket.priority == 'High'
    end
  end

  def medium
    Ticket.all.each do |ticket|
      ticket.priority == 'Medium'
    end
  end

  def low
    Ticket.all.each do |ticket|
      ticket.priority == 'Low'
    end
  end

  def open
    Ticket.all.each do |ticket|
      ticket.ticket_status == 'Open'
    end
  end

  def pending
    Ticket.all.each do |ticket|
      ticket.ticket_status == 'Pending'
    end
  end

  def closed
    Ticket.all.each do |ticket|
      ticket.ticket_status == 'Closed'
    end
  end

  def all_check_dates
    Payroll.all.map do |payr|
      payr.check_date
    end
  end

end
