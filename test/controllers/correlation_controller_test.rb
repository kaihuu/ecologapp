require 'test_helper'

class CorrelationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get correlation_index_url
    assert_response :success
  end

  test "should get view" do
    get correlation_view_url
    assert_response :success
  end

end
