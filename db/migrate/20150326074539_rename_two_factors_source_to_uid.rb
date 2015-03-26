class RenameTwoFactorsSourceToUid < ActiveRecord::Migration
  def change
    rename_column :two_factors, :source, :uid
  end
end
