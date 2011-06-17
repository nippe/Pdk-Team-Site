class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, :default => false
      t.integer :activity_type_id
      t.string :correlation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
