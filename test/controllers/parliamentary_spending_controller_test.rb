require 'test_helper'

class ParliamentarySpendingControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get root_path
    assert_response :success
  end

end
