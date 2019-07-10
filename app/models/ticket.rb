class Ticket < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :company

  has_many :comp_users, through: :company
  has_many :users, through: :company

  @high = []
  @medium = []
  @low = []


  @open = []
  @pending = []
  @closed = []

  def self.priorities
    Ticket.all.each do |ticket|
      @high.push(ticket) if ticket.priority == 'High'
      @medium.push(ticket) if ticket.priority == 'Medium'
      @low.push(ticket) if ticket.priority == 'Low'
      @open.push(ticket) if ticket.ticket_status == 'Open'
      @pending.push(ticket) if ticket.ticket_status == 'Pending'
      @closed.push(ticket) if ticket.ticket_status == 'Closed'
    end
    byebug
  end

end
