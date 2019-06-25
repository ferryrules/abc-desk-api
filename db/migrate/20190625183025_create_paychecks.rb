class CreatePaychecks < ActiveRecord::Migration[5.2]
  def change
    create_table :paychecks do |t|
      t.float :hours, default: 0
      t.float :ot_hours, default: 0
      t.float :pto_hours, default: 0
      t.float :vacation_hours, default: 0
      t.float :holiday_hours, default: 0
      t.float :sick_hours, default: 0
      t.belongs_to :payroll, foreign_key: true
      t.belongs_to :employee, foreign_key: true

      t.timestamps
    end
  end
end
