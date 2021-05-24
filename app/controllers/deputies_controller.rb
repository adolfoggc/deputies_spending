class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all.order(:name)
  end

  def show
  end
end
