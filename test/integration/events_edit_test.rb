require 'test_helper'

class EventInterfaceTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @event = events(:event_1)
    @user = users(:kevin)
    sign_in @user
  end

  test "invalid edit" do
    patch event_path(@event), params: { event: { title: " ", 
                                          description: " ", 
                                          date: " ", 
                                          location: " " } }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid edit" do
    title = "Concert"
    patch event_path(@event), params: { event: { title: "Concert", 
                                          description: "Music", 
                                          date: 80.days.from_now, 
                                          location: "Venue" } }
    assert_redirected_to @event        
    follow_redirect!
    assert_not flash.empty?
    assert_match title, response.body
  end
end