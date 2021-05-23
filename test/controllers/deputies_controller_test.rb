require 'test_helper'

class DeputiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deputies_index_url
    assert_response :success
  end

  test "should get show" do
    get deputies_show_url
    assert_response :success
  end

end
