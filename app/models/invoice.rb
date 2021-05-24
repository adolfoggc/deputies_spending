class Invoice < ApplicationRecord
  belongs_to :deputy

  enum document_kind: {
    fiscal_document: 0,
    receipt: 1,
    foreign_expenses: 2
  }

  def translate_kind
    if self.fiscal_document?
      return "Documento Fiscal"
    elsif self.receipt?
      return "Recibo"
    else
      return "Despesa no Exterior"
    end
  end
end
