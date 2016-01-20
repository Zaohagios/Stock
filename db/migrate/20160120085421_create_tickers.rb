class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :ticker_symbol
      t.decimal :buy_price
      t.decimal :units
      t.decimal :fee
      t.decimal :profit
      t.timestamps null: false
    end
  end
end
