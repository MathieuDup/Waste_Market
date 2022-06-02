class DropTablePgSearchDocuments < ActiveRecord::Migration[6.1]
  def change
    drop_table :pg_search_documents
  end
end
