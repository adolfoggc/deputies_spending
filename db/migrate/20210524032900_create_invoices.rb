class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :deputy, null: false, foreign_key: true
      t.string :description
      t.string :specific_description
      t.string :seller
      t.string :cnpj_cpf
      t.string :number
      t.integer :document_kind
      t.date :issue_date
      t.decimal :value

      t.timestamps
    end
  end
end
