require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
  end

  test 'Should redirect to root path after sign up' do
    post :create, user: { first_name: "User", last_name: "Test", email: "user_test@gmail.com", password: "456", password_confirmation: "456" }
    assert_redirected_to root_path
  end

  test 'should redirect to Current User show after edit profile' do
    session[:user_id] = @user.id
    edit_profile = {first_name: "Tester", last_name: "User", email: "magic_rails@mail.com", password: "123", password_confirmation: "123"}
    patch :update, id: @user, user: edit_profile
    assert_redirected_to @user
  end
end
