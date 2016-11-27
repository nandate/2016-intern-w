class RepliesController < ApplicationController
  def index
    @replies=Reply.all
  end

  def new
    @reply=Reply.new
  end

  def create
    @blog=Blog.find(params[:blog_id])
    @reply=@blog.replies.create(reply_params)
    if @reply.save
      redirect_to @blog
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
