class ParliamentarySpendingController < ApplicationController
	def upload
	end

	def import
		rowarray = Array.new
		myfile = params[:cvs_file].tempfile.path
		i = 0
		rows = 0
		column_titles = []
		cearenses = Hash.new

		if Invoice.all.count > 0
			Invoice.all.each do |invoice|
				invoice.destroy
			end
		end

		if Deputy.all.count > 0
			Deputy.all.each do |deputy|
				deputy.destroy
			end
		end

		File.open(myfile).each_line do |row|
				i = 0
				row = row.split(";")
				while i < row.length do
					row[i] = row[i].gsub!(/[^0-9A-Za-zÁáÂâÃãÀàÉéÍíÓóÔôÚúÇç ]/, '')

					if rows == 0
						column_titles << row[i]
					end
					i += 1
				end

				if( row[column_titles.index("sgUF")]  == "CE")
					unless cearenses.has_key?( row[column_titles.index("ideCadastro")] )
						new_deputy = Deputy.new(
							name: row[column_titles.index("txNomeParlamentar")], 
							deputy_id: row[column_titles.index("ideCadastro")], 
							party: row[column_titles.index("sgPartido")],
							federal_unity: row[column_titles.index("sgUF")].downcase,
							cpf: row[column_titles.index("cpf")]
						)
						new_deputy.save
						
						cearenses[ row[column_titles.index("ideCadastro")] ] = new_deputy.id
					end

					invoice = Invoice.new(
						deputy_id: cearenses[ row[column_titles.index("ideCadastro")] ],
						description: row[column_titles.index("txtDescricao")],
						specific_description: row[column_titles.index("txtDescricaoEspecificacao")],
						seller: row[column_titles.index("txtFornecedor")],
						cnpj_cpf: row[column_titles.index("txtCNPJCPF")],
						number: row[column_titles.index("txtNumero")],
						document_kind: row[column_titles.index("indTipoDocumento")].to_i,
						issue_date: row[column_titles.index("datEmissao")],
						value: row[column_titles.index("vlrLiquido")]
					)

					invoice.save!
				end
			rows += 1
		end

		redirect_to deputies_index_path
	end

end
