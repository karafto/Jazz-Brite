require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:kevin)
  end

  test "should redirect edit when not logged in" do
    get edit_user_registration_path
    assert_redirected_to new_user_session_url
  end

  test "should redirect update when not logged in" do
    patch user_registration_path, params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_redirected_to new_user_session_url
  end

  test "should prevent destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_registration_path(@user)
    end
  end
end
