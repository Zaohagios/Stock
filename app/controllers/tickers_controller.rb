class TickersController < ApplicationController
    before_action :set_ticker, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def edit
    end
    
    def update
        @ticker.owner = current_user.id
        if @ticker.update(ticker_params)
            flash[:success] = @ticker.ticker_symbol + " was updated."
            redirect_to tickers_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @ticker_symbol = @ticker.ticker_symbol
        @ticker.destroy
        flash[:warning] = "Watcher for " + @ticker_symbol + " was deleted."
        redirect_to tickers_path
    end
    
    def index
        @tickers = Ticker.where(owner: current_user.id).find_each
    end
    
    def new
        @ticker = Ticker.new
    end
    
    def create
        @ticker = Ticker.new(ticker_params)
        @ticker.owner = current_user.id
        if @ticker.save
            flash[:success] = "Your Ticker Watcher was created"
            redirect_to ticker_path(@ticker)
        else
            render 'new'
        end
    end
    
    private
        def ticker_params
            params.require(:ticker).permit(:ticker_symbol, :buy_price, :units, :fee, :profit, :owner)
        end
        
        def set_ticker
            @ticker = Ticker.find(params[:id])
        end
end