require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get feedback" do
    get pages_feedback_url
    assert_response :success
  end

end
