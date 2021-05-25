module ApplicationHelper
  def to_real value
    number_to_currency(value, unit: "R$", separator: ",", delimiter: ".")   
  end
end
