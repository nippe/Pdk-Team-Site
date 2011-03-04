class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :personal_number
      t.string :street_address
      t.string :zip_code
      t.string :living_area
      t.boolean :active
      t.string :home_phone
      t.string :mobile_phone
      t.string :email
      t.text :goals
      t.boolean :wants_reminders
      t.integer :reminder_time
      t.string :player_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
