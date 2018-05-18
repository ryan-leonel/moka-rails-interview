require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "Name can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(price: 12345, business_id: business)
    assert_not item.save
  end

  test "Price can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(name: "Test Item", business_id: business)
    assert_not item.save
  end

  test "Price must be a number" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(name: "Test Item", price: "NaN", business_id: business)
    assert_not item.save
  end

  test "Price can't be negative" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(name: "Test Item", price: -1, business_id: business)
    assert_not item.save
  end

  test "Price must be greater than 0" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(name: "Test Item", price: 0, business_id: business)
    assert_not item.save
  end

  test "Can't create item without business" do
    item = Item.new(name: "Test Item", price: 12345)
    assert_not item.save
  end

  test "Create item successful with all validations passed" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    item = Item.new(name: "Test Item", price: 12345, business_id: business)
    assert item.save
  end
end
