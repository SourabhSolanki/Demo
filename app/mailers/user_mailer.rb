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


end
