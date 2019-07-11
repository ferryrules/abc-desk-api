class AddCashReqToPayroll < ActiveRecord::Migration[5.2]
  def change
    add_column :payrolls, :cash_req, :integer
  end
end
