require 'test_helper'

class EventInterfaceTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @event = events(:event_1)
    @user = users(:kevin)
    sign_in @user
  end

  test "invalid submission" do
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: " ", 
                                          description: " ", 
                                          date: " ", 
                                          location: " " } }
    end
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid submission followed by deletion" do
    title = "Jazz"
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: "Jazz", 
                                          description: "description", 
                                          date: 1.days.from_now, 
                                          location: "location" } }
    end
    valid_event = Event.last
    assert_redirected_to valid_event
    follow_redirect!
    assert_not flash.empty?
    assert_match title, response.body
    assert_difference 'Event.count', -1 do
      delete event_path(valid_event)
    end
  end

  test "invalid edit" do
    get edit_event_path(@event)
    patch event_path(@event), params: { event: { title: " ", 
                                          description: " ", 
                                          date: " ", 
                                          location: " " } }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid edit" do
    
  end
end