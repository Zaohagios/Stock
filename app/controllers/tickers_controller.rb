class TickersController < ApplicationController
    before_action :set_ticker, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def edit
    end
    
    def update
        if @ticker.update(ticker_params)
            flash[:notice] = @ticker.ticker_symbol + " was updated."
            redirect_to tickers_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @ticker_symbol = @ticker.ticker_symbol
        @ticker.destroy
        flash[:notice] = "Watcher for " + @ticker_symbol + " was deleted."
        redirect_to tickers_path
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
    
    private
        def ticker_params
            params.require(:ticker).permit(:ticker_symbol, :buy_price, :units, :fee, :profit)
        end
        
        def set_ticker
            @ticker = Ticker.find(params[:id])
        end
end