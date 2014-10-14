# require 'rails_helper'
#
# feature "User visits website and signs up" do
#   scenario "After user clicks sign up email sent confirmation of signing up" do
#
#   ActionMailer::Base.deliveries = []
#   prev_count = Confirmation.count
#   visit root_path
#
#   click_on "Sign Up"
#
#   fill_in("Username", with: "Nick123")
#   fill_in("Email", with: "mclaughlin.nick@gmail.com")
#   fill_in("First Name", with: "Nick")
#   fill_in("Last Name", with: "McLaughlin")
#   fill_in("Zip", with: "02322")
#   fill_in("Password", with: "12345678")
#   fill_in("Sex", with: "Male")
#
#   click_on "Sign Up"
#
#   expect(page).to have_content('You registered successfully')
#   expect(UserConfirmation.count).to eq(prev_count + 1)
#   expect(ActionMailer::Base.deliveries.size).to eql(1)
#
#   last_email = ActionMailer::Base.deliveries.last
#   expect(last_email).to have_subject('Parking Confirmation')
#   expect(last_email).to deliver_to('mclaughlin.nick@gmail.com')
#   end
# end
