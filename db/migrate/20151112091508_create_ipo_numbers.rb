class CreateIpoNumbers < ActiveRecord::Migration
  def change
    create_table :ipo_numbers do |t|
      t.integer :ipo_id

      t.timestamps
    end
  end
end
