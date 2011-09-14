class CreateDebts < ActiveRecord::Migration
  def self.up
    create_table :debts, :id => false do |t|
      t.integer :expensee_user_id 
      t.integer :guilty_user_id
      t.integer :sum
      t.boolean :paid
      t.boolean :payment_approved

      t.timestamps
    end
  end

  def self.down
    drop_table :debts
  end
end
