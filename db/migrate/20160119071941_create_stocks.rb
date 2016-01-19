class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker_symbol
      t.decimal :buy_price
      t.timestamps
    end
  end
end
