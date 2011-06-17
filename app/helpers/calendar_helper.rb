module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def event_link(event)
    link_to(event.name, polymorphic_path(event), :title => event.name)
  end

  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true,
      :use_javascript => true,
      :first_day_of_week => @first_day_of_week
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="/events/#{event.id}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end

  # Overriding stuff

  # default html for displaying an event's time
    # to customize: override, or do something similar, in your helper
    # for instance, you may want to add localization
    def display_event_time(event, day)
      time = event.start_at
      if !event.all_day and time.to_date == day
        # try to make it display as short as possible
        #format = (time.min == 0) ? "%H" : "%H:%M"
        format = "%H:%M"
        t = time.strftime(format)
        %(<span class="ec-event-time">#{t}</span>)
      else
        ""
      end
    end
end
