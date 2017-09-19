class CommentMailer < ApplicationMailer
	def comment_email(user,article,comment)
    @user = user
    @article=article
    @comment=comment
    @cname=User.find(@comment.user_id)
   
    mail(to: @user.email, from:@cname.email ,subject: 'Comment Details')
  end
end
