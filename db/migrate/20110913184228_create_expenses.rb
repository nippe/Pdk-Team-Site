class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.int :user_id
      t.int :ammount
      t.bool :paid_in_full

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
