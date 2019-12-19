class TagsController < ApplicationController

  include TagsHelper

  def index
  @tags = Tag.all
  end


  def show
  @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to 'http://localhost:3000/'
   end
end
