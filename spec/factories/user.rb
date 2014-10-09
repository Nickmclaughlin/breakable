FactoryGirl.define do
  factory :user, aliases: [:poster, :recipient] do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:username) { |n| "user_name#{n}" }
    password "12345678910"
    sex "Male"
    zip "02322"
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
