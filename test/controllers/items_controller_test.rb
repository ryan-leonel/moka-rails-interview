require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    @business = Business.create!(name: "Test Business", address: "Test Street", city: "Test City", user_id: @user.id)
  end

  test 'should redirect to Current User show if Create Business not present' do
    session[:user_id] = @user.id
    get :index
    assert_redirected_to @user
  end

  test 'should display index if Create Business present' do
    session[:user_id] = @user.id
    @user.business = @business
    @user.save
    get :index
    assert_response :success
  end

  test 'Should redirect to Item index after add item' do
    session[:user_id] = @user.id
    @user.business = @business
    @user.save
    post :create, item: { name: "Test Item", price: 1000 }
    assert_redirected_to items_path
  end

  test 'Should redirect to Item index after edit item' do
    session[:user_id] = @user.id
    old_item = Item.create!(name: "Test Item", price: 1000, business: @business)
    new_item = {name: "Item Test", price: 10000}
    patch :update, id: old_item, item: new_item
    assert_redirected_to items_path
  end

  test 'Should redirect to Item index after delete item' do
    session[:user_id] = @user.id
    item = Item.create!(name: "Test Item", price: 1000, business: @business)
    delete :destroy, id: item
    assert_redirected_to items_path
  end
end
