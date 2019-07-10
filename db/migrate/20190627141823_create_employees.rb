class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :pay_type
      t.float :pay_rate
      t.string :active_status, default: 'Active'
      t.string :filing_status
      t.integer :w4_allowance, default: 0
      t.belongs_to :company, foreign_key: true
    end
  end
end
