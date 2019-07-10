class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name, :high, :medium, :low, :open, :pending, :closed, :hours, :all_check_dates

  has_many :departments
  has_many :payrolls
  has_many :tickets

  has_many :comp_users
  has_many :users, through: :comp_users

  has_many :employees
  # has_many :employees, through: :departments

  def high
    @high = []
    Ticket.all.each do |ticket|
      @high.push(ticket) if ticket.priority == 'High'
    end
    @high
  end

  def medium
    @medium = []
    Ticket.all.each do |ticket|
      @medium.push(ticket) if ticket.priority == 'Medium'
    end
    @medium
  end

  def low
    @low = []
    Ticket.all.each do |ticket|
      @low.push(ticket) if ticket.priority == 'Low'
    end
    @low
  end

  def open
    @open = []
    Ticket.all.each do |ticket|
      @open.push(ticket) if ticket.ticket_status == 'Open'
    end
    @open
  end

  def pending
    @pending = []
    Ticket.all.each do |ticket|
      @pending.push(ticket) if ticket.ticket_status == 'Pending'
    end
    @pending
  end

  def closed
    @closed = []
    Ticket.all.each do |ticket|
      @closed.push(ticket) if ticket.ticket_status == 'Closed'
    end
    @closed
  end

  def hours
    total_hours = 0
    
  end

  def all_check_dates
    Payroll.all.map do |payr|
      payr.check_date
    end
  end

end
