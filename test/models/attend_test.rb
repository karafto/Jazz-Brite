require 'test_helper'

class AttendTest < ActiveSupport::TestCase
  
  def setup
    @attend = Attend.new(attendee_id: users(:kevin).id,
                          attended_event_id: events(:event_6).id)
  end

  test "should be valid" do
    assert @attend.valid?
  end

  test "should require an attendee_id" do
    @attend.attendee_id = nil
    assert_not @attend.valid?
  end

  test "should require an attended_event_id" do
    @attend.attended_event_id = nil
    assert_not @attend.valid?
  end
end
