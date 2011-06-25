class RvspsController < ApplicationController
  def index
    @rvsps = Rvsp.find_by_activity_id(params[:activity_id])
  end

  
  def attend
    rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    rvsp.rvsp_status_id = 1

    if rvsp.save
      redirect_to(:activities, :notice => "Du er anmld till trningen")
    end
  end

  def maybe
    rvsp = Rvsp.find_by_activity_id_and_user_id(params[:activity_id], params[:user_id])
    rvsp.rvsp_status_id = 3

    if rvsp.save
      #format.html{ redirect_to(activities_path, :notice => "Du er anmld till trningen") }
      redirect_to(activities_path, :notice => "Du er anmld till trningen")
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
