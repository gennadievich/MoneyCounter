require 'test_helper'

class CurrencyControllerTest < ActionController::TestCase
  test "should get getcurrency" do
    get :getcurrency
    assert_response :success
  end

end
