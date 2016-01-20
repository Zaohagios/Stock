class AddProfitToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :profit, :decimal
  end
end
