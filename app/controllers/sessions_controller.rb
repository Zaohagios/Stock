class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'You are now logged in'
      tickers = Ticker.where(owner: current_user.id).find_each
      redirect_to tickers.count == 0 ? new_ticker_path : tickers_path
    else
      flash[:danger] = 'Invalid email and or password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
  
end
