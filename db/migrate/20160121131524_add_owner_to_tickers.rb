class AddOwnerToTickers < ActiveRecord::Migration
  def change
    add_column :tickers, :owner, :integer
  end
end
