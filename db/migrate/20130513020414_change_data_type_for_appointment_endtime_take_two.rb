class ChangeDataTypeForAppointmentEndtimeTakeTwo < ActiveRecord::Migration

  def self.up
    change_table :appointments do |t|
      t.change :endtime, :datetime
    end
  end

  def self.down
    change_table :appointments do |t|
      t.change :endtime, :time
    end
  end

end
