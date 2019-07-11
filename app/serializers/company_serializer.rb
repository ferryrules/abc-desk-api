class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name, :all_tickets, :active, :terminated, :hourly, :salary

  has_many :departments
  has_many :payrolls
  has_many :tickets
  has_many :employees

  has_many :comp_users
  has_many :users, through: :comp_users

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

  def all_tickets
    all_tickets = {
      all: Ticket.all,
      open: Ticket.all.filter { |tic| tic.ticket_status == 'Open' },
      pending: Ticket.all.filter { |tic| tic.ticket_status == 'Pending' },
      closed: Ticket.all.filter { |tic| tic.ticket_status == 'Closed' },
      high: Ticket.all.filter { |tic| tic.priority == 'High' },
      medium: Ticket.all.filter { |tic| tic.priority == 'Medium' },
      low: Ticket.all.filter { |tic| tic.priority == 'Low' },
    }
  end

end
