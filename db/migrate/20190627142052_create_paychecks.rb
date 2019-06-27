class CreatePaychecks < ActiveRecord::Migration[5.2]
  def change
    create_table :paychecks do |t|
      t.float :hours, default: 0.00
      t.float :ot_hours, default: 0.00
      t.float :pto_hours, default: 0.00
      t.float :vacation_hours, default: 0.00
      t.float :holiday_hours, default: 0.00
      t.float :sick_hours, default: 0.00
      t.belongs_to :payroll, foreign_key: true
      t.belongs_to :employee, foreign_key: true
    end
  end
end
