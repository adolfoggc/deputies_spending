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

				if( row[column_titles.index("sgUF")]  == "CE")
					unless cearenses.include?(row[column_titles.index("ideCadastro")])
						
						cearenses << row[column_titles.index("ideCadastro")]
						Deputy.create!(
							name: row[column_titles.index("txNomeParlamentar")], 
							deputy_id: row[column_titles.index("ideCadastro")], 
							party: row[column_titles.index("sgPartido")],
							federal_unity: row[column_titles.index("sgUF")].downcase,
							cpf: row[column_titles.index("cpf")]
						)
					end
				end

			rescue
			end
			rows += 1
		end

		byebug
	end
end
