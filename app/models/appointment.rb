class Appointment < ActiveRecord::Base
  validates_presence_of :date, :endtime, :name, :user_id, :starttime

  attr_accessible :date, :endtime, :name, :user_id, :starttime

  belongs_to :user

  def self.by_date(date)
    self.find_all_by_date(date)
  end

end
