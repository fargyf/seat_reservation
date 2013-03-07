# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :area do
    name "MyString"
    description "MyText"
    x_max 1
    y_max 1
  end
end
