class CreateIpoApplicants < ActiveRecord::Migration
  def change
    create_table :ipo_applicants do |t|
      t.string :production
      t.string :base_unit
      t.decimal :issue_price, precision: 10, scale: 2
      t.integer :total_stock
      t.integer :ipo_count
      t.integer :top_limit
      t.datetime :start_time
      t.datetime :end_time
      t.integer :state, limit: 2
      t.integer :member_id
      t.integer :audit_id
      t.datetime :audit_time

      t.timestamps
    end
  end
end
