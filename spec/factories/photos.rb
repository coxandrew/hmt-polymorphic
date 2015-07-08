FactoryGirl.define do
  sequence :name do |n|
    "photo-#{n}"
  end

  factory :photo do
    name
  end
end
