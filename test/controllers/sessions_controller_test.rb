require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
  end

  test 'Should redirect to root path after login' do
    post :create, session: { email: "test_user@gmail.com", password: "123" }
    assert_redirected_to root_path
  end

  test 'Should render same page when login failed' do
    post :create, session: { email: "test_user@gmail.com", password: "456" }
    assert_response :success
    assert_template :new
  end

  test 'Should redirect to root path after logout' do
    session[:user_id] = @user.id
    delete :destroy
    assert_redirected_to root_path
  end
end
