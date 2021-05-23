class ParliamentarySpendingController < ApplicationController
	def upload
	end

	def import
		rowarray = Array.new
		myfile = params[:cvs_file].tempfile.path
		i = 0
		rows = 0
		column_titles = []
		cearenses = []
		if Deputy.all.count > 0
			Deputy.all.each do |deputy|
				deputy.destroy
			end
		end

		File.open(myfile).each_line do |row|
			begin
				i = 0
				row = row.split(";")
				while i < row.length do
					row[i] = row[i].gsub!(/[^0-9A-Za-zÁáÂâÃãÀàÉéÍíÓóÔôÚú]/, '')

					if rows == 0
						column_titles << row[i]
					end
					i += 1
				end

				if( row[colunas.index("sgUF")]  == "CE")
					unless cearenses.include?(row[colunas.index("ideCadastro")])
						cearenses << row[colunas.index("ideCadastro")]
						Deputy.create(
							name: to_name(row[colunas.index("txNomeParlamentar")]), 
							deputy_id: row[colunas.index("ideCadastro")], 
							party: row[colunas.index("sgPartido")],
							federal_unity: row[colunas.index("sgUF")].downcase,
							cpf: row[colunas.index("cpf")]
						)
					end
				end

			rescue
			end
			rows += 1
		end
	end
end
