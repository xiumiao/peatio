class AddMemberTypeAndOrganizationAndFaxtelAndTelphoneToIdDocuments < ActiveRecord::Migration
  def change
    add_column :id_documents, :member_type, :integer
    add_column :id_documents, :oraganization, :integer
    add_column :id_documents, :faxtel, :string
    add_column :id_documents, :telphone, :string
  end
end
