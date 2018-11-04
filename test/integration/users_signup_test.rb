require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post '/users', params: { user: { name:  "",
                                       email: "user@invalid",
                                       password:              "foo",
                                       password_confirmation: "bar" } }
    end
    assert_template 'devise/registrations/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information followed by deletion" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post '/users', params: { user: { name:  "Example User",
                                       email: "user@example.com",
                                       password:              "password",
                                       password_confirmation: "password" } }
    end
    follow_redirect!
    assert_select 'div.alert'
    assert_select 'a[href=?]', destroy_user_session_path, text: "Log Out"
    assert_difference 'User.count', -1 do
      delete user_registration_path
    assert_redirected_to events_path
    follow_redirect!
    assert_not flash.empty?
    assert_select 'a[href=?]', new_user_session_path, text: "Log In"
    end
  end
end
