class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :member_id
      t.integer :fee_type
      t.decimal :factor_bid, precision: 10, scale: 2
      t.decimal :factor_ask, precision: 10, scale: 2

      t.timestamps
    end
  end
end
