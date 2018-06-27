require 'test_helper'

class AttendsControllerTest < ActionDispatch::IntegrationTest
  
  test "create should require logged-in user" do
    assert_no_difference 'Attend.count' do
      post attends_path
    end
    assert_redirected_to new_user_session_url
  end

  test "destroy should require logged-in user" do
    event = events(:event_6)
    assert_no_difference 'Attend.count' do
      delete attend_path(event)
    end
    assert_redirected_to new_user_session_url
  end
end
