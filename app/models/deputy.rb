class Deputy < ApplicationRecord

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
end
