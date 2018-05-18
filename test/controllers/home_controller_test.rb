require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
  end

  test 'Should redirect to Current User show if login' do
    session[:user_id] = @user.id
    get :index
    assert_redirected_to @user
  end

  test 'Should redirect to login path if not login' do
    get :index
    assert_redirected_to login_path
  end
end
