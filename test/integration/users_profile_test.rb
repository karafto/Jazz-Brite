require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:kevin)
  end
  
  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_match @user.events.count.to_s, response.body
    assert_select "a[href=?]", user_path(upcoming: true)
    assert_select "a[href=?]", user_path(past: true)
    assert_select "a[href=?]", user_path(created: true)
  end

end
