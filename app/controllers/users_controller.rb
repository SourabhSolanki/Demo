class UsersController < ApplicationController
	
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      respond_to do |f|
        f.html { redirect_to login_path }
        f.json { render :json => @user }
      end
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
