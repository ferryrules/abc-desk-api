class CreatePaycheckAdjustment < ActiveRecord::Migration[5.2]
  def change
    create_table :paycheck_adjustments do |t|
      t.string :adj_type
      t.float :adj_amount
      t.string :description
      t.belongs_to :paycheck, foreign_key: true
      t.belongs_to :employee, foreign_key: true
    end
  end
end
