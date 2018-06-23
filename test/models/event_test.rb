require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:kevin)
    @event = @user.events.build(title: "title", description: "description", date: 1.days.from_now, location: "location")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user id should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end

  test "title should be present" do
    @event.title = "   "
    assert_not @event.valid?
  end

  test "description should be present" do
    @event.description = "   "
    assert_not @event.valid?
  end

  test "date should be present" do
    @event.date = "   "
    assert_not @event.valid?
  end

  test "location should be present" do
    @event.location = "   "
    assert_not @event.valid?
  end
end
