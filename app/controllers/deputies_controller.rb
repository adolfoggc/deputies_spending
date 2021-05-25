class DeputiesController < ApplicationController
	def index
		@deputies = Deputy.all.order(:name)
	end

	def show
		@deputy = Deputy.find_by(id: params[:id])
		@invoices = @deputy.total_in_invoices
	end

	def ranking
		@deputies_array = []
		@position = 1
		count = 0
		Deputy.all.each do |deputy|
			invoices = deputy.total_in_invoices
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
		
	end
end
