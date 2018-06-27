require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.name = "a" * 1
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "name should be unique" do
    duplicate_user = @user.dup
    duplicate_user.name = @user.name.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "associated events should be destroyed" do
    @user.save
    @user.events.create!(title: "title", 
                        description: "description", 
                        date: 1.days.from_now, 
                        location: "location")
    assert_difference 'Event.count', -1 do
      @user.destroy
    end
  end

  test "should attend and unattend a event" do
    kevin = users(:kevin)
    event  = events(:event_6)
    assert_not kevin.attending?(event)
    kevin.attend(event)
    assert kevin.attending?(event)
    assert event.attendees.include?(kevin)
    kevin.unattend(event)
    assert_not kevin.attending?(event)
  end
end
