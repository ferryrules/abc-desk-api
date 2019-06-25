class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :pay_type
      t.float :pay_rate
      t.boolean :active_status, default: true
      t.string :filing_status
      t.integer :w4_allowances
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
