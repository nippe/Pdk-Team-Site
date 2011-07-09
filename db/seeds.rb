# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ActivityType.create(:name => "Träning", :image_path => "/image/indicators/activity-workout.png")
ActivityType.create(:name => "Match", :image_path => "/image/indicators/activity-game.png")
ActivityType.create(:name => "Annan", :image_path => "/image/indicators/calendar_month.png")

Role.create(:name => "Admin")
Role.create(:name => "Player")
Role.create(:name => "Guest")



#User.create()