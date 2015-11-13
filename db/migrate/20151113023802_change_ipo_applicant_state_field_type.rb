class ChangeIpoApplicantStateFieldType < ActiveRecord::Migration
  def change
    change_column :ipo_applicants, :state, :string
  end
end
