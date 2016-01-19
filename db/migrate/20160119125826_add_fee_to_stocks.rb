class AddFeeToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :fee, :decimal
  end
end
