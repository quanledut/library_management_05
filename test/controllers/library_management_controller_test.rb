require "test_helper"

class LibraryManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get library_management_home_url
    assert_response :success
  end

  test "should get help" do
    get library_management_help_url
    assert_response :success
  end
end
