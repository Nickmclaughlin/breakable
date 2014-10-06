FactoryGirl.define do
  factory :post do
    message "HAHAHAHAHAHHAHA"

    association :poster, factory: :user
    association :recipient, factory: :user
  end
end
