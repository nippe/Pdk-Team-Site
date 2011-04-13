class WallPost < ActiveRecord::Base
   validates_presence_of :body
   belongs_to :user


end
