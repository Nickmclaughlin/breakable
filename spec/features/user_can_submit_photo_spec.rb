require 'rails_helper'

feature "Admin can edit delete a user" do
  scenario "User can submit photo" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit edit_user_path(user)

    attach_file "Photo", Rails.root.join('spec/fixtures/download.jpeg')

    click_on "Submit Photo"

    expect(page).to have_content("You have successfully added a photo.")
  end

  scenario "User prompted when they click submit without attaching photo" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit edit_user_path(user)

    click_on "Submit Photo"

    expect(page).to have_content("You need to submit photo.")
  end

  scenario "User can submit photo then designate it as a profile picture" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit edit_user_path(user)


    attach_file "Photo", Rails.root.join('spec/fixtures/download.jpeg')

    click_on "Submit Photo"

    expect(page).to have_content("You have successfully added a photo.")

    click_on "More Photos"

    click_on "Make Profile Picture"

    select('true', :from => 'Profile photo')
    click_on "Make Profile Picture"
    expect(page).to have_content("You have successfully updated your photo.")
  end
end
