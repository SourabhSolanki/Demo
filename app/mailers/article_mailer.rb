class ArticleMailer < ApplicationMailer
  def article_status(user,article)
    @user = user
    @article =article
    mail(to: @user.email, subject: 'About Article Status')
  end 

end
