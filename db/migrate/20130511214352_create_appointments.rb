class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.date :date
      t.time :starttime
      t.time :endtime
      t.integer :person

      t.timestamps
    end
  end
end
