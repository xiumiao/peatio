class AddEmployerToIdDocuments < ActiveRecord::Migration
  def change
    add_column :id_documents, :employer_type, :string
    add_column :id_documents, :employer_id, :integer
  end
end
