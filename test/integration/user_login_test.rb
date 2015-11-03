require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    User.create(username: "Shannon", password: "thisismypassword")
    visit login_path

    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "thisismypassword"
    click_button "Login"

    assert page.has_content?("Welcome Shannon")
  end

  test "guest user can not login" do
    visit login_path

    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "thisismypassword"
    click_button "Login"

    assert page.has_content?("Invalid Attempt. Try Again.")
  end

  test "registered user can not login with wrong password" do
    User.create(username: "Shannon", password: "thisismypassword")
    visit login_path

    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid Attempt. Try Again.")
  end

  test "registered user can logout" do
    User.create(username: "Shannon", password: "thisismypassword")
    visit login_path

    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "thisismypassword"
    click_button "Login"

    click_link "Logout"

    assert page.has_content?("Goodbye")
  end
end
