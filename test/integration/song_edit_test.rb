require 'test_helper'

class SongEditTest < ActionDispatch::IntegrationTest

  test "a registered user can assign a category to a song" do
    @user = User.create(username: "Shannon", password: "thisismypassword")
    visit login_path

    fill_in "Username", with: "Shannon"
    fill_in "Password", with: "thisismypassword"
    click_button "Login"

    @song = Song.create(title: "Single Ladies", artist: "Beyonce")
    Category.create(subject: "Rap")
    Category.create(subject: "Hip Hop")
    Category.create(subject: "Classical")

    visit songs_path
    click_link 'edit'


    select("Hip Hop", :from => 'Category')
    click_button "Update Song"
    save_and_open_page
    assert page.has_content?("Hip Hop")
  end

end
