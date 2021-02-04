require "test_helper"

class AcessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get acess_index_url
    assert_response :success
  end

  test "should get login" do
    get acess_login_url
    assert_response :success
  end
end
