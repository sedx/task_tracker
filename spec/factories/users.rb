FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    password "testtest"
    email {Faker::Internet.email}

    factory :admin do
      admin true
      email Faker::Internet.email
    end
  end
end
