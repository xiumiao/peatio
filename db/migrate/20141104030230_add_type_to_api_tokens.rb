class AddTypeToAPITokens < ActiveRecord::Migration
  def change
    add_column :api_tokens, :type, :string
  end
end
