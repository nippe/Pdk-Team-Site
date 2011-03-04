class CreateRvspStatuses < ActiveRecord::Migration
  def self.up
    create_table :rvsp_statuses do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :rvsp_statuses
  end
end
