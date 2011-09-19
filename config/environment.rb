# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PdkTeamSite::Application.initialize!

Time::DATE_FORMATS[:pdk_short_date] = "%Y-%m-%d"