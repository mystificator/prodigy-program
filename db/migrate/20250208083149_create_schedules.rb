class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.integer :day

      t.timestamps
    end
  end
end
