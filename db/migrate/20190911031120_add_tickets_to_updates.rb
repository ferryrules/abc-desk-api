class AddTicketsToUpdates < ActiveRecord::Migration[5.2]
  def change
    add_reference :updates, :ticket, foreign_key: true
  end
end
