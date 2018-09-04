class AddSubTypeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :subtype, :integer
  end
end
