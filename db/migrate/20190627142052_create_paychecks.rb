class CreatePaychecks < ActiveRecord::Migration[5.2]
  def change
    create_table :paychecks do |t|
      t.float :hours
      t.float :ot_hours
      t.float :pto_hours
      t.float :vacation_hours
      t.float :holiday_hours
      t.float :sick_hours
      t.belongs_to :payroll, foreign_key: true
      t.belongs_to :employee, foreign_key: true
    end
  end
end
