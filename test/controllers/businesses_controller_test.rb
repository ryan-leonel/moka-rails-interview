require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
  end

  test 'Should redirect to Current User show after add business' do
    session[:user_id] = @user.id
    post :create, business: { name: "Test Business", address: "Test Street", city: "Test City" }
    assert_redirected_to @user
  end

  test 'Should redirect to Current User show after edit business' do
    session[:user_id] = @user.id
    old_business = Business.create!(name: "Test Business", address: "Test Street", city: "Test City", user_id: @user.id)
    new_business = { name: "Business Test", address: "Street Test", city: "City Test" }
    patch :update, id: old_business, business: new_business
    assert_redirected_to @user
  end

  test 'Should redirect to Current User show after delete business' do
    session[:user_id] = @user.id
    business = Business.create!(name: "Test Business", address: "Test Street", city: "Test City", user_id: @user.id)
    delete :destroy, id: business
    assert_redirected_to @user
  end
end
