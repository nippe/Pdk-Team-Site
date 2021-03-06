class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :first_name
      t.string :last_name
      t.string :personal_number
      t.string :street_address
      t.string :zip_code
      t.string :living_area
      t.boolean :active
      t.string :home_phone
      t.string :mobile_phone
      t.text :goals
      t.boolean :wants_reminders
      t.integer :reminder_time
      t.string :player_type_id
      t.integer :login_count
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
