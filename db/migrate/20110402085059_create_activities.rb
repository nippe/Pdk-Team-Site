class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :title
      t.datetime :start_time
      t.decimal :duration, :precision => 3, :scale => 1
      t.boolean :all_day
      t.integer :activity_type_id
      t.string :correlation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
