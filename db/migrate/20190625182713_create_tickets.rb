class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :priority
      t.string :category
      t.belongs_to :user, foreign_key: true
      t.belongs_to :comp_user, foreign_key: true
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
