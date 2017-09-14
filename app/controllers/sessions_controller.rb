class SessionsController < ApplicationController
  layout false, only: [:new,:create]
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email] , password: params[:session][:password])
    if @user.present?
      session[:current_user_id] = @user.id
      if @user[:role]== "admin"
        redirect_to  admin_home_user_path(@user)
      else
        redirect_to  user_home_user_path(@user)
      end
    else
      flash.now[:error]="Invalid Email id or password"
      render :new      
    end
  end

   
  def destroy
    session.delete(:current_user_id)
    redirect_to root_url
  end
end
