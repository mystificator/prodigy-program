class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :frequency
      t.string :duration
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
