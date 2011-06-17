class CalendarController < ApplicationController
  
  def index
    #weeks starts with monday in sweden
    @first_day_of_week = 1


    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    # Tying in Activity model into calendar
    start_d, end_d = Event.get_start_and_end_dates(@shown_month, @first_day_of_week)
    @events = Event.events_for_date_range(start_d, end_d)
    @activities = Activity.events_for_date_range(start_d, end_d)
    @event_strips = Event.create_event_strips(start_d, end_d, @events + @activities)

    #@event_strips = Event.event_strips_for_month(@shown_month, @first_day_of_week)

  end
  
end
