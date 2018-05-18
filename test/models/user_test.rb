require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "First name can't be blank" do
    user = User.new(last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    assert_not user.save
  end

  test "Last name can't be blank" do
    user = User.new(first_name: "Test", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    assert_not user.save
  end

  test "Email can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", password: "123", password_confirmation: "123")
    assert_not user.save
  end

  test "Email can't be invalid" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user", password: "123", password_confirmation: "123")
    assert_not user.save
  end

  test "Password can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password_confirmation: "123")
    assert_not user.save
  end

  test "Password confirmation can't be blank" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123")
    assert_not user.save
  end

  test "Password can't be different with password confirmation" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "456")
    assert_not user.save
  end

  test "Sign up successful with all validations passed" do
    user = User.new(first_name: "Test", last_name: "User", email: "test_user@gmail.com", password: "123", password_confirmation: "123")
    assert user.save
  end
end
