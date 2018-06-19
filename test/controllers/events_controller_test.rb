require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_event_path
    assert_response :success
  end

  test "should get create" do
    get events_create_url
    assert_response :success
  end

  test "should get show" do
    get @event_path
    assert_response :success
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

  test "should get edit" do
    get edit_event_path
    assert_response :success
  end

  test "should get delete" do
    get events_delete_url
    assert_response :success
  end

end
