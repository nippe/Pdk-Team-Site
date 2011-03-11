class AddingPropertiesToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :work_phone, :string
    add_column :players, :picture_url, :string
  end

  def self.down
    remove_column :players, :work_phone
    remove_column :players, :picture_url
  end
end
