class Appointment < ActiveRecord::Base
  attr_accessible :date, :endtime, :name, :person, :starttime
end
