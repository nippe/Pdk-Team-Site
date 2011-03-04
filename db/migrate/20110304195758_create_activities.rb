class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.datetime :start_time
      t.integer :duration
      t.boolean :all_day
      t.string :type
      t.guid :correlation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
