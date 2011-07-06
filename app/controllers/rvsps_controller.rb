class RvspsController < ApplicationController
  #TODO: Acl9 protect the controller. Verify that it works with json-jQuery stuff to

  def index
    @rvsps = Rvsp.find_by_activity_id(params[:activity_id])
  end

  #TODO: Make private
  def generate_json(activity)
    "{\"result\":\"ok\", \"user_id\":" + params[:user_id] + ", \"logged_in_user_id\":" + current_user.id.to_s + ",\n\"activity_summary\":{\"activity_id\": " + params[:activity_id] + ",\"attending\":" + activity.attending.count.to_s + ", \"maybe\":" + activity.maybe_coming.count.to_s + ",\"not_comming\":" + activity.not_coming.count.to_s + ", \"no_answer\":" + activity.no_answer.count.to_s + "}}"
  end

#TODO: Maybe use current_user here in the controller instead for posting it via the url, that way you have to be logged on to rvsp...
  def attend
    @rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    @rvsp.rvsp_status_id = 1
    activity = Activity.find_by_id(params[:activity_id])

    respond_to do |format|
      if @rvsp.save
        format.json { render :json => generate_json(activity) }
        format.html { redirect_to(:activities, :notice => "Du er anmld till trningen") }
        format.xml { render :xml => @rvsp, :status => :attending, :location => :activities }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @rvsp.errors, :status => :unprocessable_entity }
      end
    end
  end


  def maybe
    rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    rvsp.rvsp_status_id = 3
    activity = Activity.find_by_id(params[:activity_id])

    respond_to do |format|
      if rvsp.save
        format.json { render :json => generate_json(activity) }
        format.html { redirect_to(activities_path, :notice => "Du er anmld till trningen") }
      else
         format.json { render :json => @rvsp.errors, :status => :unprocessable_entity }
      end
    end
  end

  

  def not
    rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    rvsp.rvsp_status_id = 2
    activity = Activity.find_by_id(params[:activity_id])

    respond_to do |format|
      if rvsp.save
        format.json { render :json => generate_json(activity) }
        format.html{ redirect_to(:activities, :notice => "Du er anmld till trningen")}
      else
        format.json { render :json => @rvsp.errors, :status => :unprocessable_entity }        
      end
    end
  end

end
