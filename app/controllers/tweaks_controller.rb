class TweaksController < ApplicationController

  # GET /tweaks
  # GET /tweaks.xml
  def index
    @tweaks = Tweak.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweaks }
    end
  end

  # GET /tweaks/1
  # GET /tweaks/1.xml
  def show
    @tweak = Tweak.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweak }
    end
  end

  # GET /tweaks/new
  # GET /tweaks/new.xml
  def new
    @tweak = Tweak.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweak }
    end
  end

  # GET /tweaks/1/edit
  def edit
    @tweak = Tweak.find(params[:id])
  end

  # POST /tweaks
  # POST /tweaks.xml
  def create
    @tweak = Tweak.new(params[:tweak])

    respond_to do |format|
      if @tweak.save
        flash[:notice] = 'tweak was successfully created.'
        format.html { redirect_to(@tweak) }
        format.xml  { render :xml => @tweak, :status => :created, :location => @tweak }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweak.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweaks/1
  # PUT /tweaks/1.xml
  def update
    @tweak = Tweak.find(params[:id])

    respond_to do |format|
      if @tweak.update_attributes(params[:tweak])
        flash[:notice] = 'tweak was successfully updated.'
        format.html { redirect_to(@tweak) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweak.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweaks/1
  # DELETE /tweaks/1.xml
  def destroy
    @tweak = Tweak.find(params[:id])
    @tweak.destroy

    respond_to do |format|
      format.html { redirect_to(tweaks_url) }
      format.xml  { head :ok }
    end
  end
end
