require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get searchspendings" do
    get :searchspendings
    assert_response :success
  end

end
