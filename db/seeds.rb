# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ActivityType.delete_all
ActivityType.create(:name => 'TrÃ¤ning', :image_path => '/images/indicators/activity-workout.png')
ActivityType.create(:name => 'Match', :image_path => '/images/indicators/activity-game.png')
ActivityType.create(:name => 'Annan aktivitet', :image_path => '/images/indicators/calendar_month.png')

Role.delete_all
Role.create(:name => 'Admin')
Role.create(:name => 'Player')
Role.create(:name => 'Guest')

Activity.delete_all
Activity.create(:title => 'Fake activity', :start_at => Time.now + 1.month, :all_day => true, :activity_type_id => 1)

