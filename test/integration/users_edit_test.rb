require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:kevin)
    sign_in @user
  end

  test "unsuccessful edit" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    patch user_registration_path, params: { user: { name:  "",
                                                    email: "email",
                                                    password:              "foo",
                                                    password_confirmation: "bar" } }

    assert_template 'devise/registrations/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "successful edit" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    name  = "Bobby"
    email = "bobby@example.com"
    patch user_registration_path, params: { user: { name: name,
                                                    email: email,
                                                    password:              "",
                                                    password_confirmation: "",
                                                    current_password: "password"} }
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'div.alert'
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
