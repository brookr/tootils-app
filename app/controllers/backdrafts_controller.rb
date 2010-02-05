class BackdraftsController < ApplicationController
  
  # GET /backdrafts/
  def index
    @posts = Post.ordered.maximum(params[:max_status_id]).limit(40).find(:all, :include => :comments)
  end
  
  # GET /backdrafts/post/1
  def post
    @post = Post.find_by_status_id(params[:id])
    @admin = params[:do_the_admin] == 'killer'
  end

  # DELETE /backdrafts/1
  # DELETE /backdrafts/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(backdrafts_url) }
      format.xml  { head :ok }
    end
  end

end
