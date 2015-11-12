class CreateIpos < ActiveRecord::Migration
  def change
    create_table :ipos do |t|
      t.integer :pre_ipo_id
      t.integer :member_id
      t.integer :amount
      t.integer :count
      t.integer :state

      t.timestamps
    end
  end
end
