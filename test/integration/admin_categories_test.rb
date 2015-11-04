require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "an admin can access a category page" do
    admin = User.create(username: "Shannon", password: "thisismypassword", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end

  test "an admin can create a song category" do
    admin = User.create(username: "Shannon", password: "thisismypassword", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit new_admin_category_path
    fill_in "Category", with: "Hip Hop"
    click_button "Make New Category"

    assert page.has_content?("Hip Hop")
  end

  test "a non-admin can not create a song category" do
    user = User.create(username: "Shannon", password: "thisismypassword", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit new_admin_category_path

    assert page.has_content?("404")
  end

end
