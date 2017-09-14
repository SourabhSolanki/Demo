class UsersController < ApplicationController
	
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  def user_home   
  end

  def admin_home
  end  

  private
  def user_params
    params.require(:user).permit(:name, :surname, :email,:mobile,:password,
                                   :password_confirmation)
  end

end
