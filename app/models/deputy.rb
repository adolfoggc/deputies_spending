class Deputy < ApplicationRecord
	has_many :invoices

	enum federal_unity: {
		ac: 0, al: 1, am: 2, ap: 3, ba: 4, ce: 5, df: 6, es: 7, go: 8,
		ma: 10, mg: 11, ms: 12, mt: 13, na: 14, pa: 15, pb: 16, pe: 17, 
		pi: 18, pr: 19, rj: 20, rn: 21, ro: 22, rr: 23, rs: 24, sc: 25,
		se: 26, sp: 27, to: 28
	}

	def cpf_format
		self.cpf.insert(3, '.')
		self.cpf.insert(7, '.')
		self.cpf.insert(-3, '-')
	end

	def most_expensive_invoice
		self.invoices.maximum(:value)
	end

	def total_in_invoices
		total = {normal: 0, compensations: 0, mean_by_month: 0}
		self.invoices.each do |invoice|
			if invoice.value > 0
				total[:normal] += invoice.value
			else
				total[:compensations] += invoice.value
			end
		end
		total[:mean_by_month] = (total[:normal] + total[:compensations])/12
		return total
	end

end
