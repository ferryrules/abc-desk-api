class AddTicketStatusToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :ticket_status, :string
  end
end
