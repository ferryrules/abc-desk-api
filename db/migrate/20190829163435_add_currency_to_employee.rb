class AddCurrencyToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :to_currency, :string
  end
end
