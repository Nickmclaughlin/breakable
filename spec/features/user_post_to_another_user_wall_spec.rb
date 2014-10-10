require 'rails_helper'

feature "User can post on wall" do
  scenario "user successfully posts on wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in_as(user)
    visit user_path(user2)

    fill_in("Message", with: "Hello")

    click_on "Post Message"

    expect(page).to have_content("You have successfully posted a message.")
  end

  scenario "user unsuccessfully posts on wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in_as(user)
    visit user_path(user2)

    fill_in("Message", with: "")

    click_on "Post Message"

    expect(page).to have_content("Please fill out message in order to post.")
  end
end
