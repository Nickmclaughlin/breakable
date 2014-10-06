FactoryGirl.define do
  factory :user, aliases: [:poster, :recipient] do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:username) { |n| "user_name#{n}" }
    password "12345678910"
    sex "Male"
    zip "02322"
  end
end
