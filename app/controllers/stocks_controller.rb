class StocksController < ApplicationController
    before_action :set_stock, only: [:show, :edit, :update, :destroy]
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @ticker = @stock.ticker_symbol
        @stock.destroy
        flash[:notice] = "Watcher for " + @ticker + " was deleted."
    end
    
    def index
        @stocks = Stock.all
    end
    
    def new
        @stocks = Stock.new
    end
    
    def create
        @stock = Stock.new(stock_params)
        if @stock.save
            flash[:notice] = "Your Stock Watcher was created"
            redirect_to stock_path(@stock)
        else
            render 'new'
        end
    end
    
    def stock_params
        params.require(:stock).permit(:ticker_symbol, :buy_price, :units, :fee, :profit)
    end
    
    def set_stock
        @stock = Stock.find(params[:id])
    end
end