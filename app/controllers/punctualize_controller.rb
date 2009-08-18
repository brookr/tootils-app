class PunctualizeController < ApplicationController
  # GET /punctualize
  # GET /punctualize.xml
  def index
    @users = User.all.select{ |u| u.scores.first } # Get all users with a score

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scores }
    end
  end

end
