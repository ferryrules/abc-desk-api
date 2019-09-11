class AddUpdatesToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :updates, :string
  end
end
