require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:bob)
  end

  test "should redirect edit when not logged in" do
    get edit_user_registration_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
  end

  test "should redirect update when not logged in" do
    patch user_registration_path, params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
  end

  test "should redirect 'event/new' when not logged in" do
    get new_event_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
  end

end
