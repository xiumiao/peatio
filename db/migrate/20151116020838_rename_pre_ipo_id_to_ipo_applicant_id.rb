class RenamePreIpoIdToIpoApplicantId < ActiveRecord::Migration
  def change
    rename_column :ipos, :pre_ipo_id, :ipo_applicant_id
  end
end
