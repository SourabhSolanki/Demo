class UserMailer < ApplicationMailer
  helper :application
  def notification_eamil(user,article)
    @user = user
    @article =article
    mail(to: @user.email, subject: 'About Article Status')
  end 

  def request_email(user,article)
    
    @auser=User.where(:role => 'admin')
    
    @user=user
    @article=article
    mail(from: @user.email,to: @auser.first.email, subject: 'Request for approve article')

  end 

  def welcome_email(user)
    @user = user
  
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


end
