class AddUrlToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :url, :string
  end
end
