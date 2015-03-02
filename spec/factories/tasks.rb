FactoryGirl.define do

  factory :task do
    title Faker::Lorem.sentence(5)
    description Faker::Lorem.paragraph
    time Kernel.rand(1000)
    tag_list Faker::Lorem.word
  end
end