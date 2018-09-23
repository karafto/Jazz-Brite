require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:kevin)
  end
  
  test "login with invalid information" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { user: { email: "",
                                              password: "" } }
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    sign_in @user
    post user_session_path
    follow_redirect!
    assert_select 'div.alert'
    assert_select 'a[href=?]', new_user_session_path, count: 0
    assert_select 'a[href=?]', '#', text: @user.name
    assert_select 'a[href=?]', edit_user_registration_path, text: "Edit Account"
    assert_select 'a[href=?]', user_path(@user), text: "My Profile"
    assert_select 'a[href=?]', destroy_user_session_path, text: "Log Out"
    get user_path(@user)
    delete destroy_user_session_path
    assert_redirected_to events_path
    follow_redirect!
    assert_not flash.empty?
    assert_select 'a[href=?]', new_user_session_path, text: "Log In"
  end

end
