class CreateCompUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :comp_users do |t|
      t.belongs_to :company, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
