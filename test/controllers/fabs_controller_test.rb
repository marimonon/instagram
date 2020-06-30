require 'test_helper'

class FabsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fabs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get fabs_destroy_url
    assert_response :success
  end

end
