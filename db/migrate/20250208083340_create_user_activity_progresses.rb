class CreateUserActivityProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_activity_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
