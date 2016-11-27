class BlogsController < ApplicationController

  def index
    @blog=Blog.new
    @blogs=Blog.all
  end

  def new
    @blog=Blog.new
  end

  def show
    @blog=Blog.find(params[:id])
  end

  def create
    @blog=Blog.new(blog_params)
    if @blog.save
      redirect_to root_url
    end
  end

  def like
    @blog=Blog.find(params[:blog_id])
    @blog.like+=1
    @blog.save
  end

  private
  def blog_params
    params.require(:blog).permit(:body,:like)
  end
end
