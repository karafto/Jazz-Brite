require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @event = events(:event_1)
  end

  test "should redirect new when not logged in" do
    get new_event_path
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: "Lorem ipsum" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect edit when not logged in" do
    get edit_event_path(@event)
    assert_redirected_to new_user_session_url
  end

  test "should redirect update when not logged in" do
    patch event_path(@event), params: { event: { title: "Lorem ipsum" } }
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Event.count' do
      delete event_path(@event)
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect update for wrong event" do
    sign_in users(:kevin)
    event = events(:event_6)
    patch event_path(event), params: { event: { title: "Lorem ipsum" } }
    assert_redirected_to events_path
  end

  test "should prevent destroy for wrong event" do
    sign_in users(:kevin)
    event = events(:event_6)
    assert_no_difference 'Event.count' do
      delete event_path(event)
    end
  end
end
