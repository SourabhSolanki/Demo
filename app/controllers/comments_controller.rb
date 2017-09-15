class CommentsController < ApplicationController

  def create

    @user = User.find(params[:user_id])
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id=@current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to show_approved_articles_user_article_path(@user,@article) }
        format.js 
      end
    else
      flash[:error] = "please enter Comment"  
    end

  end


  def destroy
    
    @user = User.find(params[:user_id])
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "destory Sucessfully!"
      redirect_to show_approved_articles_user_article_path(@user,@article) 
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:body,:avatar)
  end
end
