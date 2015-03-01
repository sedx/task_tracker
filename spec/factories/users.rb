FactoryGirl.define do
  factory :user do
    name "Илья"
    password "testtest"
    email "test@example.com"

    factory :admin do
      admin true
    end
  end

end
