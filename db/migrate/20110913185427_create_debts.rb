class CreateDebts < ActiveRecord::Migration
  def self.up
    create_table :debts, :id => false do |t|
      t.integer :expensee_user_id 
      t.integer :user_id
      t.integer :expense_id
      t.integer :sum
      t.boolean :paid, :default => false
      t.boolean :payment_approved, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :debts
  end
end
