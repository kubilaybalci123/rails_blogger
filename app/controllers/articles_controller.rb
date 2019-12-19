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

  # def create
  #   @article = Article.new(
  #     title: params[:article][:title],
  #     body: params[:article][:body])
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

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