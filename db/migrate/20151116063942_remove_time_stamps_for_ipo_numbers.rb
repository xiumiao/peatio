class RemoveTimeStampsForIpoNumbers < ActiveRecord::Migration
  def change
    remove_columns :ipo_numbers, :created_at,:updated_at
  end
end
