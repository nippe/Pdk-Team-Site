class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.where("start_at >= ?", Date.today).order("start_at ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @activities }
      format.json { render :json => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @activity }
      format.json { render :json => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity       = Activity.new
    @activity_types = ActivityType.all
    @users          = User.all


    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @activity }
      format.json { render :json => @activity }
    end
  end


  # GET /activities/1/edit
  def edit
    @activity       = Activity.find(params[:id])
    @activity_types = ActivityType.all
    @users          = User.all
  end


  # POST /activities
  # POST /activities.xml
  def create
    if params[:activity].has_key?(:rvsps_user_id)
      invited_user_ids = params[:activity][:rvsps_user_id]
      params[:activity].delete(:rvsps_user_id)
    end

    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save

        if !invited_user_ids.nil?
          add_rvsps_to_activity(invited_user_ids)
        end

        format.html { redirect_to(@activity, :notice => "Activity was successfully created. #{invited_user_ids}") }
        format.xml { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    if params[:activity].has_key?(:rvsps_user_id)
      invited_user_ids = params[:activity][:rvsps_user_id]
      params[:activity].delete(:rvsps_user_id)

      if !invited_user_ids.nil?
        invited_user_ids.each do |user_id|
          user = User.find(user_id)

          if !@activity.is_user_invited?(user)
            rvsp                = @activity.rvsps.new()
            rvsp.user           = user
            rvsp.rvsp_status_id = 4 #TODO: Maybe use enum instead - find out how in Ruby
            rvsp.save()
          end
        end

        rvsps_for_activity = @activity.rvsps.all()
        rvsps_for_activity.each do |current_rvsp|

          if !invited_user_ids.include?(current_rvsp.user_id.to_s)
            current_rvsp.delete()
          end
        end

      end
    else
      @activity.rvsps.delete_all()
    end


    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(@activity, :notice => 'Activity was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml { head :ok }
    end
  end


  def add_rvsps_to_activity(invited_user_ids)
    invited_user_ids.each do |user_id|
      rvsp                = @activity.rvsps.new()
      rvsp.user_id        = user_id
      rvsp.rvsp_status_id = 4 #TODO: Maybe use enum instead - find out how in Ruby
      rvsp.save()
    end
  end

end
