class RepliesController < ApplicationController
	

	def create
    @user = User.find(params[:user_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replys.new(reply_params)
    @reply.article_id=@article.id
    @reply.user_id=@current_user.id
     if @current_user.present?
      if @reply.save
        respond_to do |format|
          format.html { redirect_to show_approved_articles_user_article_path(@user,@article) }
          format.js 
        end
      else
        flash[:error] = "please enter Reply"  
      end
    else
      flash[:notice] = "Please Login"
      redirect_to root_url
    end  
  end

  private
  def reply_params
    params.require(:reply).permit(:body)
  end
end



