class AddDepartmentIdToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :department, foreign_key: true
  end
end
