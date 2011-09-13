class CreateDebts < ActiveRecord::Migration
  def self.up
    create_table :debts do |t|
      t.int :expensee_user_id
      t.int :guilty_user_id
      t.int :sum
      t.bool :paid
      t.bool :payment_approved

      t.timestamps
    end
  end

  def self.down
    drop_table :debts
  end
end
