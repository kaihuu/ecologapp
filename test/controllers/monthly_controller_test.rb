require 'test_helper'

class MonthlyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get monthly_index_url
    assert_response :success
  end

  test "should get view" do
    get monthly_view_url
    assert_response :success
  end

end
