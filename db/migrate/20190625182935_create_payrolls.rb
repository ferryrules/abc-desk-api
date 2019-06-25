class CreatePayrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :payrolls do |t|
      t.string :payroll_status, default: 'Not Started'
      t.date :start_date
      t.date :end_date
      t.date :check_date
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
