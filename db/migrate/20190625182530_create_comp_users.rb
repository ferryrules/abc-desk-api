class CreateCompUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :comp_users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :permission
      t.string :fname
      t.string :lname
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
