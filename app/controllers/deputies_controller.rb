class DeputiesController < ApplicationController
	def index
		@deputies = Deputy.all.order(:name)
	end

	def show
		@deputy = Deputy.find_by(id: params[:id])
		@invoices = @deputy.invoices_info
	end

	def ranking
		@deputies_array = []
		@position = 1
		count = 0
		@total = 0
		Deputy.all.each do |deputy|
			invoices = deputy.invoices_info
			deputy_data = {name: deputy.name, total_spent: invoices[:normal] + invoices[:compensations], id: deputy.id}
			# ordering array
			ordered = false
			@deputies_array << deputy_data
			i = (@deputies_array.length - 1)
			while !ordered && i > 0
				if @deputies_array[i][:total_spent] > @deputies_array[i-1][:total_spent]
					@deputies_array[i], @deputies_array[i-1] = @deputies_array[i-1], @deputies_array[i]
				elsif @deputies_array[i][:total_spent] <= @deputies_array[i-1][:total_spent]
					ordered = true
				end
				i -= 1
			end
		end
		@names = []
		@expenses = []
		@deputies_array.each do |deputy_data|
			@names << deputy_data[:name].to_json.html_safe
			@expenses << deputy_data[:total_spent]
			@total += deputy_data[:total_spent]
		end
	end
end
