class BackdraftsController < ApplicationController
  
  # Get to /backdrafts/
  def index
    @posts = Post.ordered
  end
  
  # Get to /backdrafts/post/1
  def post
    @post = Post.find_by_status_id(params[:id])
  end

end
