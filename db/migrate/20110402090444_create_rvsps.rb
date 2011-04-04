class CreateRvsps < ActiveRecord::Migration
  def self.up
    create_table :rvsps do |t|
      t.integer :activity_id
      t.integer :user_id
      t.integer :rvsp_status_id
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :rvsps
  end
end
