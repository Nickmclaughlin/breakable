require 'rails_helper'

feature "Admin can edit delete a user" do

  let(:admin) { FactoryGirl.create(:admin) }

  scenario "admin can click can go to update page for user" do
    user = FactoryGirl.create(:user)
    sign_in_as(admin)
    visit admin_users_path

    click_on "Edit"
    expect(page).to have_content("Edit #{user.username}")
  end

  scenario "user cannot go to edit page for a neighborhood" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit admin_users_path

    expect(page).to have_content("Invalid request")

  end

  scenario "admin edits a user" do
    user = FactoryGirl.create(:user)
    sign_in_as(admin)
    visit admin_users_path

    click_on "Edit"
    expect(page).to have_content("Edit #{user.username}")

    fill_in('Zip', with: "23456")
    fill_in('Bio', with: "")

    click_on "Update Profile"

    expect(page).to have_content("Successfully update the user")
  end

  scenario "admin deletes a user" do
    user = FactoryGirl.create(:user)
    sign_in_as(admin)
    visit admin_users_path

    click_on "Delete"
    expect(page).to_not have_content("You Deleted User.")
  end
end
