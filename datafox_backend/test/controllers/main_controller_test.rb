require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get filter" do
    get :filter
    assert_response :success
  end

end
