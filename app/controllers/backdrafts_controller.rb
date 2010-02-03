class BackdraftsController < ApplicationController
  
  # Get to /backdrafts/
  def index
    @posts = Post.ordered
  end
  
  # Get to /backdrafts/posts/1
  def posts
    @post = Post.find_by_status_id(params[:id])
  end

end
