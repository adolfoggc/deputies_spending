class ParliamentarySpendingController < ApplicationController
	def upload
	end


	def import
		rowarray = Array.new
		myfile = params[:cvs_file].tempfile.path
		i = 0
		rows = 0
		colunas = [] #temporário para teste
		cearenses = []
		File.open(myfile).each_line do |row|
			begin
				i = 0
				row = row.split(";")
				while i < row.length do
					row[i] = row[i].gsub("\"", '')
					row[i] = row[i].gsub("\n", '') if row[i].include?("\n")
					if rows == 0
						colunas << row[i]
					end
					i += 1
				end

				if( row[colunas.index("sgUF")]  == "CE")
					cearenses << row
				end

			rescue
			end
			rows += 1
		end
	end
end
