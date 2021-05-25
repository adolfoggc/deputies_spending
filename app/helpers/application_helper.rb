module ApplicationHelper
  def to_real value
    number_to_currency(value, unit: "R$", separator: ",", delimiter: ".")   
  end

  def nav_link text, link, this_controller_name, this_controller_action = nil
    if this_controller_action.nil? || this_controller_action.blank?
      link_to text, link, class: "nav-link #{controller.controller_name == this_controller_name ? 'active' : '' }"
    else
      link_to text, link, class: "nav-link #{controller.action_name == this_controller_action ? 'active' : '' }"
    end
  end
end
