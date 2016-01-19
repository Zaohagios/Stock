class AddUnitsToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :units, :decimal
  end
end
