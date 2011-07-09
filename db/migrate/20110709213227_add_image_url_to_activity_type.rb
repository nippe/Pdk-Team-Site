class AddImageUrlToActivityType < ActiveRecord::Migration
  def self.up
    add_column :activity_types, :image_path, :string
  end

  def self.down
    remove_column :activity_types, :image_path
  end
end
