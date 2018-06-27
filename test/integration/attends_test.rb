require 'test_helper'

class AttendsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:kevin)
    sign_in @user
    @event = events(:event_4)
  end

  test "should attend an event" do
    assert_difference '@event.attendees.count', 1 do
      post attends_path, params: { attended_event_id: @event.id }
    end
  end
end
