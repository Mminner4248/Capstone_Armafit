class CreateUserSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :user_schedules do |t|
      t.references :schedule, foreign_key: true
      t.references :user, foreign_key: true
      t.text :user_notes
      t.boolean :attended

      t.timestamps
    end
  end
end
