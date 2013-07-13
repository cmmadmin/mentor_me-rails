# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    body { Faker::Lorem.paragraph }
    develop_category { [:snapshot, :develop, :lifelist].sample }
    question_type :text
  end
end
