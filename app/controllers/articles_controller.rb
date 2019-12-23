class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
  @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    @comment.article_id = @article.id
  end

  def new
   @article = Article.new
  end

  def create
     @article = Article.new(article_params)
     if @article.save
         flash[:notice] = "Your Article was Created"
         redirect_to article_path(@article.id) # or @article
      else
         render 'new'
      end
  end 
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "You Signed up successfully"
  #     redirect_to articles_path
  #   else
  #     render 'new'
  #   end
  # end




  def tag_list=(tags_string)

  end

 def update
  @article = Article.find(params[:id])
  @article.update(article_params)
  flash.notice = "Article '#{@article.title}' Updated!"
  redirect_to article_path(@article)
 end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to 'http://localhost:3000/'
 end

 def edit
   @article = Article.find(params[:id])
 end

end
