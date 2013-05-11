class Appointment < ActiveRecord::Base
  validates_presence_of :date, :endtime, :name, :user_id, :starttime

  attr_accessible :date, :endtime, :name, :user_id, :starttime

  belongs_to :user
end
