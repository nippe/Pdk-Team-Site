class RvspStatusesController < ApplicationController
  # GET /rvsp_statuses
  # GET /rvsp_statuses.xml
  def index
    @rvsp_statuses = RvspStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rvsp_statuses }
    end
  end

  # GET /rvsp_statuses/1
  # GET /rvsp_statuses/1.xml
  def show
    @rvsp_status = RvspStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rvsp_status }
    end
  end

  # GET /rvsp_statuses/new
  # GET /rvsp_statuses/new.xml
  def new
    @rvsp_status = RvspStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rvsp_status }
    end
  end

  # GET /rvsp_statuses/1/edit
  def edit
    @rvsp_status = RvspStatus.find(params[:id])
  end

  # POST /rvsp_statuses
  # POST /rvsp_statuses.xml
  def create
    @rvsp_status = RvspStatus.new(params[:rvsp_status])

    respond_to do |format|
      if @rvsp_status.save
        format.html { redirect_to(@rvsp_status, :notice => 'Rvsp status was successfully created.') }
        format.xml  { render :xml => @rvsp_status, :status => :created, :location => @rvsp_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rvsp_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rvsp_statuses/1
  # PUT /rvsp_statuses/1.xml
  def update
    @rvsp_status = RvspStatus.find(params[:id])

    respond_to do |format|
      if @rvsp_status.update_attributes(params[:rvsp_status])
        format.html { redirect_to(@rvsp_status, :notice => 'Rvsp status was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rvsp_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rvsp_statuses/1
  # DELETE /rvsp_statuses/1.xml
  def destroy
    @rvsp_status = RvspStatus.find(params[:id])
    @rvsp_status.destroy

    respond_to do |format|
      format.html { redirect_to(rvsp_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
