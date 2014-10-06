require 'rails_helper'

feature "After log in user can update profile" do
  scenario "User can update profile" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit root_path

    click_on "Complete Profile"

    fill_in("Age", with: 19)
    fill_in("Profession", with: "Coder")
    fill_in("Bio", with: "Man")
    fill_in("Zip", with: "02322")
    fill_in("Interests", with: "Wow")

    click_on "Update Profile"

    expect(page).to have_content("You have successfully updated your profile.")

  end

  scenario "User updates zip blank" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit root_path

    click_on "Complete Profile"

    fill_in("Zip", with: "")

    click_on "Update Profile"

    expect(page).to have_content("prohibited")

  end
end
