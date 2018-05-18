require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  test "Create business successful with all validations passed" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    assert_not business.save
  end

  test "Name can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(address: "Test Street", city: "Test City", user_id: user)
    assert_not business.save
  end

  test "Address can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", city: "Test City", user_id: user)
    assert_not business.save
  end

  test "City can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", user_id: user)
    assert_not business.save
  end

  test "Can't create business without user" do
    business = Business.new(name: "Test Business", address: "Test Street")
    assert_not business.save
  end

  test "Create business successful with all validations passed" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    business = Business.new(name: "Test Business", address: "Test Street", city: "Test City", user_id: user)
    assert business.save
  end
end
