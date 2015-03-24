class AddSourceToTwoFactors < ActiveRecord::Migration
  def change
    # Use source to save things like Phone number, Wechat id and etc.
    add_column :two_factors, :source, :string
  end
end
