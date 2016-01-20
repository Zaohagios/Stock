class TickersController < ApplicationController
    before_action :set_ticker, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @ticker = @ticker.ticker_symbol
        @ticker.destroy
        flash[:notice] = "Watcher for " + @ticker + " was deleted."
    end
    
    def index
        @tickers = Ticker.all
    end
    
    def new
        @ticker = Ticker.new
    end
    
    def create
        @ticker = Ticker.new(ticker_params)
        if @ticker.save
            flash[:notice] = "Your Ticker Watcher was created"
            redirect_to ticker_path(@ticker)
        else
            render 'new'
        end
    end
    
    def ticker_params
        params.require(:ticker).permit(:ticker_symbol, :buy_price, :units, :fee, :profit)
    end
    
    def set_ticker
        @ticker = Ticker.find(params[:id])
    end
end