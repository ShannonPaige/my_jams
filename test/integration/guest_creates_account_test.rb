require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test "guest can create a login" do
    visit new_user_path
    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "thisismypassword"
    click_button "Create Account"

    assert page.has_content?("Welcome Shannon")
  end
end
