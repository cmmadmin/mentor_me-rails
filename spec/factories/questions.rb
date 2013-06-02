# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    body { Faker::Lorem.paragraph }
    develop_category { [:snapshot, :develop, :lifelist].sample }
    answer_type :text
  end
end
