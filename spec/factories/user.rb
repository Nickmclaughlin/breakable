FactoryGirl.define do
  factory :user, aliases: [:poster, :recipient] do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:username) { |n| "user_name#{n}" }
    password "12345678910"
    sex "Male"
    zip "02322"
    last_sign_in_at "2014-10-09 19:18:51"
  end

  factory :admin, class: User do
    email "Admin@email.com"
    username  "Admin"
    password "12345678"
    admin true
    sex "Male"
    zip "02322"
  end
end
