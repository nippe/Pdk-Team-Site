class RvspsController < ApplicationController
  #TODO: Acl9 protect the controller. Verify that it works with json-jQuery stuff to

  def index
    @rvsps = Rvsp.find_by_activity_id(params[:activity_id])
  end


  def attend
    @rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    @rvsp.rvsp_status_id = 1

    respond_to do |format|
      if @rvsp.save
        format.json { render :json => "[{\"result\":\"ok\"}]" }
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

    respond_to do |format|
      if rvsp.save
        format.json{ render :json => rvsp.activity, :json => rvsp.activity.rvsps }  #TODO: Fix so this returns a summary of rvsps for the activity
        format.html{ redirect_to(activities_path, :notice => "Du er anmld till trningen")}
      end
    end
  end

  def not
    rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    rvsp.rvsp_status_id = 2

    if rvsp.save
      redirect_to(:activities, :notice => "Du er anmld till trningen")
    end
  end

end
