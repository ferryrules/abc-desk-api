class AddPayrollFreqToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :payroll_freq, :string
  end
end
