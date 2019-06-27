class CreateRecurringAdjustment < ActiveRecord::Migration[5.2]
  def change
    create_table :recurring_adjustments do |t|
      t.string :adj_type
      t.float :adj_amount
      t.string :description
      t.belongs_to :employee, foreign_key: true
    end
  end
end
