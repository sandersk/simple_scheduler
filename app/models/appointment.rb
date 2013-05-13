class Appointment < ActiveRecord::Base
  validates_presence_of :date, :endtime, :name, :user_id, :starttime
  validate :no_time_conflict
  validate :start_before_end
  # Add validation that start time must be before end time
  attr_accessible :date, :endtime, :name, :user_id, :starttime

  belongs_to :user

  def self.by_date(date)
    self.find_all_by_date(date)
  end

  def no_time_conflict
    # Check to make sure there are no conflicting appointments scheduled for the specified date and time block
    # Get all existing appointments on the same date as new appointment
    other_appointments_same_day = Appointment.by_date(date)
    other_appointments_same_day.each do |appt|
      # For a new appointment not to conflict, one of the following must be true:
      # 1. Both its start time and end time must be *before the start time* of the existing appt
      # 2. Both its start time and end time must be *after the end time* of the existing appt
      unless ((starttime < appt.starttime) & (endtime < appt.starttime)) || ((starttime > appt.endtime) & (endtime > appt.endtime))
        errors.add(:starttime, "Appointment conflicts with appointment #{appt.name} from #{appt.starttime} to #{appt.endtime} on #{appt.date}")
      end
    end
  end

  def start_before_end
    # Check to make sure starttime is earlier than endtime
    unless starttime <= endtime
      errors.add(:endtime, "End time of meeting (#{endtime.strftime("%l:%M %p")}) is before start time of meeting (#{starttime.strftime("%l:%M %p")})")
    end
  end

end