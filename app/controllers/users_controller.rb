class UsersController < ApplicationController
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your Account is registered!"
      redirect_to new_ticker_path
    else
      render 'new'
    end
  end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end