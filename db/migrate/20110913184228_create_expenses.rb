class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :ammount
      t.boolean :paid_in_full

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
