class YardagesController < ApplicationController
  # GET /yardages
  # GET /yardages.xml
  def index
    @yardages = Yardage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @yardages }
    end
  end

  # GET /yardages/1
  # GET /yardages/1.xml
  def show
    @yardage = Yardage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @yardage }
    end
  end

  # GET /yardages/new
  # GET /yardages/new.xml
  def new
    @yardage = Yardage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @yardage }
    end
  end

  # GET /yardages/1/edit
  def edit
    @yardage = Yardage.find(params[:id])
  end

  # POST /yardages
  # POST /yardages.xml
  def create
    @yardage = Yardage.new(params[:yardage])

    respond_to do |format|
      if @yardage.save
        format.html { redirect_to(@yardage, :notice => 'Yardage was successfully created.') }
        format.xml  { render :xml => @yardage, :status => :created, :location => @yardage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @yardage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /yardages/1
  # PUT /yardages/1.xml
  def update
    @yardage = Yardage.find(params[:id])

    respond_to do |format|
      if @yardage.update_attributes(params[:yardage])
        format.html { redirect_to(@yardage, :notice => 'Yardage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @yardage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /yardages/1
  # DELETE /yardages/1.xml
  def destroy
    @yardage = Yardage.find(params[:id])
    @yardage.destroy

    respond_to do |format|
      format.html { redirect_to(yardages_url) }
      format.xml  { head :ok }
    end
  end
end
