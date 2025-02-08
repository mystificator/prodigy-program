class CreateScheduledActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :scheduled_activities do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
