require 'test_helper'

class EventsInterfaceTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @event = events(:event_1)
    @user = users(:kevin)
    @other_user = users(:alex)
  end

  test "event display when not logged in" do
    get event_path(@event)
    assert_select "a[href=?]", user_path(@event.user), text: @user.name
    assert_select "a[href=?]", new_user_session_path, text: "Log in"
    assert_select "a[href=?]", edit_event_path(@event), count: 0
    assert_select "a[href=?]", event_path(@event), text: "Delete", count: 0
  end

  test "event display when logged in followed by display of wrong event" do
    sign_in @user
    get event_path(@event)
    assert_select "a[href=?]", user_path(@event.user), text: @user.name
    assert_select "a[href=?]", edit_event_path(@event), text: "Edit"
    assert_select "a[href=?]", event_path(@event), text: "Delete"
    assert_select "a[href=?]", new_user_registration_path, count: 0
    assert_select "a[href=?]", new_user_session_path, count: 0
    event = events(:event_6)
    get event_path(event)
    assert_select "a[href=?]", user_path(event.user), text: @other_user.name
    assert_select "a[href=?]", edit_event_path(@event), count: 0
    assert_select "a[href=?]", event_path(@event), count: 0
    assert_select "a[href=?]", new_user_registration_path, count: 0
    assert_select "a[href=?]", new_user_session_path, count: 0
  end
end
