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
    
    if @current_user.present?
      if @article.save
        if @user[:role]=="admin"
          redirect_to admin_home_user_path(@user)
        else
          redirect_to user_home_user_path(@user)
        end
        ArticleMailer.article_status(@user,@article).deliver
      else
        flash[:error] = "please enter Title and Text Both."
        render 'new'
      end
    else
      flash[:error] = "please login."
      redirect_to  root_url
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
    UserMailer.request_email(@user,@article).deliver
  end

  def approved_article
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update_column(:status,"2")
    respond_to do |format|
      format.js { render :layout=>false}
    end
    
    UserMailer.notification_eamil(@user,@article).deliver

  end
  
  def deny_article
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    @article.update_column(:status,"3")
    respond_to do |format|
      format.js { render :layout=>false}
    end
    UserMailer.notification_email(@user,@article).deliver
  end


  def destroy
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
    if @current_user.present?
      @article.destroy
      respond_to do |f|
        f.html { redirect_to user_articles_user_articles_path(@user) }
        f.js
      end
    else
      flash[:error] = "please Login."
      redirect_to root_url
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
