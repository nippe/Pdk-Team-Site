class RvspsController < ApplicationController
  # GET /rvsps
  # GET /rvsps.xml
  def index
    @rvsps = Rvsp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rvsps }
    end
  end

  # GET /rvsps/1
  # GET /rvsps/1.xml
  def show
    @rvsp = Rvsp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rvsp }
    end
  end

  # GET /rvsps/new
  # GET /rvsps/new.xml
  def new
    @rvsp = Rvsp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rvsp }
    end
  end

  # GET /rvsps/1/edit
  def edit
    @rvsp = Rvsp.find(params[:id])
  end

  # POST /rvsps
  # POST /rvsps.xml
  def create
    @rvsp = Rvsp.new(params[:rvsp])

    respond_to do |format|
      if @rvsp.save
        format.html { redirect_to(@rvsp, :notice => 'Rvsp was successfully created.') }
        format.xml  { render :xml => @rvsp, :status => :created, :location => @rvsp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rvsp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rvsps/1
  # PUT /rvsps/1.xml
  def update
    @rvsp = Rvsp.find(params[:id])

    respond_to do |format|
      if @rvsp.update_attributes(params[:rvsp])
        format.html { redirect_to(@rvsp, :notice => 'Rvsp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rvsp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rvsps/1
  # DELETE /rvsps/1.xml
  def destroy
    @rvsp = Rvsp.find(params[:id])
    @rvsp.destroy

    respond_to do |format|
      format.html { redirect_to(rvsps_url) }
      format.xml  { head :ok }
    end
  end
end
