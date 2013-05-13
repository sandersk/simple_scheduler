class ChangeDataTypeForAppointmentStarttime < ActiveRecord::Migration
  def self.up
    change_table :appointments do |t|
      t.change :starttime, :datetime
    end
  end

  def self.down
    change_table :appointments do |t|
      t.change :starttime, :time
    end
  end
end
