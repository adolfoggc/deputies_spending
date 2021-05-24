class Invoice < ApplicationRecord
	belongs_to :deputy

	enum document_kind: {
		fiscal_document: 0,
		receipt: 1,
		foreign_expenses: 2,
		not_defined: 4
	}

	def translate_kind
		if self.fiscal_document?
			return "Documento Fiscal"
		elsif self.receipt?
			return "Recibo"
		elsif self.foreign_expenses
			return "Despesa no Exterior"
		else
			return "Despesa não Definida"
		end
	end

end
