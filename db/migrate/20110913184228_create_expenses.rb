class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.integer :user_id
      #t.integer :amount
      t.string :description
      t.datetime :date
      t.boolean :paid_in_full, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
