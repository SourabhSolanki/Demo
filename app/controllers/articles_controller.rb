class ArticlesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end
 
  def new
    @user = User.find(params[:user_id])
    @article = Article.new
  end
 
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.new(article_params)
    
    if @article.save
      if @user[:role]=="admin"
        redirect_to admin_home_user_path(@user)
      else
        redirect_to user_home_user_path(@user)
      end
    else
      flash[:error] = "please enter Title and Text Both."
      render 'new'
    end
  end

  def list_of_requested_articles
    @articles=Article.where(:status => 'request_send')
  end

  def list_of_approved_articles
     @articles=Article.where(:status => 'request_approved')
  end
 

  def user_articles
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end
  

  def request_status
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update_column(:status,"1")
    respond_to do |format|
      format.js { render :layout=>false}
    end 
  end

  def approved_article
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update_column(:status,"2")
    respond_to do |format|
      format.js { render :layout=>false}
    end
  end
  
  def deny_article
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update_column(:status,"3")
    respond_to do |format|
      format.js { render :layout=>false}
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.destroy
 
    if @user[:role]=="admin"
      redirect_to admin_home_user_path(@user)
    else
      redirect_to user_home_user_path(@user)
    end 
  end

  def show_approved_articles
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end


  def edit
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])  
  end


  def update
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to user_articles_user_articles_path(@user)
    else
      render 'edit'
      flash.now[:error] = "Could not save client"
    end
  end
 
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
