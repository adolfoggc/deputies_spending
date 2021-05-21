require 'test_helper'

class ParliamentarySpendingControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get parliamentary_spending_upload_url
    assert_response :success
  end

end
