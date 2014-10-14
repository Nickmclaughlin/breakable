require 'rails_helper'

feature "User can delete their profile" do
  scenario "Visit profile page delete profile" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit edit_user_path(user)

    click_on "Delete Profile"

    expect(page).to have_content("You have successfully deleted your account.")
  end
end
