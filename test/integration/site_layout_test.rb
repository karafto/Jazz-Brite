require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, text: "Jazz-Brite"
    assert_select "a[href=?]", events_path, text: "Browse Events"
    assert_select "a[href=?]", new_event_path, text: "Create Event"
    assert_select "a[href=?]", new_user_session_path, text: "Go to Demo login"
    assert_select "a[href=?]", events_path, text: "Explore Jazz"
    assert_select "a[href=?]", events_path, text: "Invite Friends"
    assert_select "a[href=?]", new_user_session_path, text: "Log In", count: 2
    get events_path
    assert_select "a[href=?]", "#past", text: "Past Events"
    assert_select "a[href=?]", "#near", text: "Upcoming Near You"
    assert_select "a[href=?]", "#upcoming", text: "Upcoming Events"
    get new_user_registration_path
    assert_select "a[href=?]", user_facebook_omniauth_authorize_path,
                                text: "Continue with Facebook"
    assert_select "a[href=?]", new_user_session_path, text: "Log in"
    get new_user_session_path
    assert_select "a[href=?]", user_facebook_omniauth_authorize_path,
                                text: "Continue with Facebook"
    assert_select "a[href=?]", new_user_registration_path, text: "Create an account"
    assert_select "a[href=?]", new_user_password_path, text: "(Forgot your password?)"
  end
end

