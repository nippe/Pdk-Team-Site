class ActivitiesController < ApplicationController
  respond_to :html, :xml, :json
  respond_to :rss, :atom, :only => :index
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.where("start_at >= ?", Date.today).order("start_at ASC").page(params[:page]).per(15)
    respond_with(@activities)
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_with(@activity)
  end


  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new
    @activity_types = ActivityType.all
    @users = User.all

    respond_with(@activity)
  end


  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
    @activity_types = ActivityType.all
    @users = User.all
  end

  def get_next_dates(repeat_interval, current_start_at, current_end_at)


    case
      when repeat_interval == "weekly"
        next_date = current_start_at + 1.week
        next_end_date = current_end_at + 1.week
      when repeat_interval == "monthly"
        next_date = current_start_at + 1.month
        next_end_date = current_end_at + 1.month
      else
        next_date = current_start_at + 1.year
        next_end_date = current_end_at + 1.year
    end

    logger.debug(" -> Current date: #{current_start_at}, Next start date: #{next_date}")

    return next_date, next_end_date
  end


  # POST /activities
  # POST /activities.xml
  def create

    is_repeating = false
    repeat_interval = ""
    repeat_end_date = Time.now()

    logger.debug("Entering create method, checking for invidted users")
    if params[:activity].has_key?(:rvsps_user_id)
      invited_user_ids = params[:activity][:rvsps_user_id]
      params[:activity].delete(:rvsps_user_id)
      logger.debug("Found :rvsps_user - #{invited_user_ids}")
    end

    logger.debug("Looking for :repeat_interval")
    if params[:activity].has_key?(:repeat_interval)
      repeat_interval = params[:activity][:repeat_interval]
      params[:activity].delete(:repeat_interval)
      logger.debug("Found Repeat interval: #{repeat_interval}")
    end

    logger.debug("Looking for :repeat_end_date")
    if params[:activity].has_key?(:repeat_end_date)
      logger.debug(":repeat_end_date exits")
      if !params[:activity][:repeat_end_date].nil? then
        repeat_end_date = Time.parse(params[:activity][:repeat_end_date]) if !params[:activity][:repeat_end_date].empty?
        logger.debug("Found repeat_end_date: #{repeat_end_date}")
      end
      params[:activity].delete(:repeat_end_date)
    end

    logger.debug("Looking for :activity_repeat")
    if params[:activity].has_key?(:activity_repeat)
      is_repeating = true
      params[:activity].delete(:activity_repeat)
      logger.debug("Found activity_repeat: #{is_repeating}")
    end

    logger.debug("Creating new activity from params[]")
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      logger.debug("Saving activity...")
      if @activity.save
        logger.debug("Activity saved")

        if !invited_user_ids.nil?
          logger.debug("Inviting users")
          @activity.add_rvsps(invited_user_ids)
        end

        logger.debug("Check if is repeating")
        if is_repeating
          logger.debug("Activity is repeating")

          correlation_id = @activity.id.to_s

          logger.debug("correlation_id set to #{correlation_id}")

          @activity.correlation_id = correlation_id
          logger.debug("Re-saving root activity with correlation_id #{correlation_id}")

          @activity.save

          next_date = Time.parse(params[:activity][:start_at]) #+ 1.hours #TODO: This is an ugly fix because I don't know how to handle time formats correctly. FIX IT!
          logger.debug(" -> Parsed date for first repeating event to #{next_date}")

          next_end_date = Time.parse(params[:activity][:end_at]) #+ 1.hours
          logger.debug(" -> Parsed end date for first repeating event to #{next_end_date}")


          while next_date <= repeat_end_date
            next_date, next_end_date = get_next_dates(repeat_interval, next_date, next_end_date)

            if next_date <= repeat_end_date
              repeat_activity = Activity.new(:start_at => next_date, 
                                             :end_at => next_end_date,
                                             :title => params[:activity][:title],
                                             :all_day => params[:activity][:all_day],
                                             :activity_type_id => params[:activity][:activity_type_id],
                                             :correlation_id => correlation_id)

              repeat_activity.save
              repeat_activity.add_rvsps(invited_user_ids)
            end

          end

        end


        format.html { redirect_to(activities_path, :notice => "Activity/ies was successfully created. Antalet inbjudna: #{invited_user_ids.count}") }
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
    @activity.correlation_id = nil
    #params[:activity].add_key(:correlation_id, nil)

    if params[:activity].has_key?(:rvsps_user_id)
      invited_user_ids = params[:activity][:rvsps_user_id]
      params[:activity].delete(:rvsps_user_id)

      if !invited_user_ids.nil?
        invited_user_ids.each do |user_id|
          user = User.find(user_id)

          if !@activity.is_user_invited?(user)
            rvsp = @activity.rvsps.new()
            rvsp.user = user
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

    logger.debug(" -> Entering Destry method")
    @activity = Activity.find(params[:id])
    logger.debug(" -> found activity #{@activity}, deleting RVSPs")

    @activity.rvsps.delete
    logger.debug(" -> RVSPs deleted, deleting activity")

    @activity.destroy
    logger.debug(" -> Activity deleted")


    flash[:notice => 'Activity deleted!']

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml { head :ok }
    end
  end


  def add_rvsps_to_activity(invited_user_ids, current_activity)
    invited_user_ids.each do |user_id|
      rvsp = current_activity.rvsps.new()
      rvsp.user_id = user_id
      rvsp.rvsp_status_id = 4 #TODO: Maybe use enum instead - find out how in Ruby
      rvsp.save()
    end
  end

end
