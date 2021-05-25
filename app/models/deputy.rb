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

	def invoices_info
		total = {
			normal: 0, 
			compensations: 0, 
			mean_by_month: 0, 
			without_url: 0, 
			invoices_quantity: 0,
			expenses_without_url: 0,
			months: [0,0,0,0,0,0,0,0,0,0,0,0],
			without_date: 0
		}
		self.invoices.each do |invoice|
			if invoice.value > 0
				total[:normal] += invoice.value
			else
				total[:compensations] += invoice.value
			end
			if invoice.url.blank?
				total[:without_url] += 1
				total[:expenses_without_url] += invoice.value
			end
			if invoice.issue_date.nil? || invoice.issue_date.blank? 
				total[:without_date] += invoice.value
			else
				total[:months][ invoice.issue_date.month.to_i - 1 ] += invoice.value
			end
			total[:invoices_quantity] += 1
		end
		total[:mean_by_month] = (total[:normal] + total[:compensations])/12
		return total
	end

end
