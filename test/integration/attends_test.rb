require 'test_helper'

class AttendsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:kevin)
    sign_in @user
    @event = events(:event_4)
  end

  test "should attend an event" do
    assert_difference '@user.attended_events.count', 1 do
      post attends_path, params: { attended_event_id: @event.id }
    end
  end

  test "should attend an event with Ajax" do
    assert_difference '@user.attended_events.count', 1 do
      post attends_path, xhr: true, params: { attended_event_id: @event.id }
    end
  end

  test "should unattend an event" do
    @user.attend(@event)
    attend = @user.active_rsvps.find_by(attended_event_id: @event.id)
    assert_difference '@user.attended_events.count', -1 do
      delete attend_path(attend), params: { attended_event_id: @event.id }
    end
  end

  test "should unattend an event with Ajax" do
    @user.attend(@event)
    attend = @user.active_rsvps.find_by(attended_event_id: @event.id)
    assert_difference '@user.attended_events.count', -1 do
      delete attend_path(attend), xhr: true, params: { attended_event_id: @event.id }
    end
  end
end