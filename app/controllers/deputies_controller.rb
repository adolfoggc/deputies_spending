class DeputiesController < ApplicationController
	def index
		@deputies = Deputy.all.order(:name)
	end

	def show
		@deputy = Deputy.find_by(id: params[:id])
		@invoices = @deputy.total_in_invoices
	end
end
