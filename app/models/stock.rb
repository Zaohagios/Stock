class Stock < ActiveRecord::Base
   validates :ticker_symbol, presence: true, length: { minimum: 1, maximum: 5 }
   validates :buy_price, numericality: { greater_than: 0, less_than: 1000 }
   validates :units, numericality: true 
   validates :fee, numericality: true
end