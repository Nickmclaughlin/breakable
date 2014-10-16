require 'rails_helper'

feature "User can post on wall" do
  scenario "female user successfully posts on wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, sex: "Female")
    sign_in_as(user2)
    visit user_path(user)

    fill_in("Message", with: "Hello")

    click_on "Post Message"

    expect(page).to have_content("You have successfully posted a message.")
  end

  scenario "female user unsuccessfully posts on wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, sex: "Female")
    sign_in_as(user2)
    visit user_path(user)

    click_on "Post Message"

    expect(page).to have_content("Please fill out message in order to post.")
  end

  scenario "male user unable to post on female's wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, sex: "female")
    sign_in_as(user)
    visit user_path(user2)

    expect(page).to have_no_content("Post Message")
  end

  scenario "User unable to post on same sex wall" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_path(user2)

    expect(page).to have_no_content("Post Message")
  end
end
