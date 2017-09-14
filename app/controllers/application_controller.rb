class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_session, except: [:new,:create]
  before_action :set_current_user
  def check_session
    if session[:current_user_id].nil? && !session[:current_user_id].present?
      redirect_to root_url
    end   
  end  


  private
  def set_current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end 

end
