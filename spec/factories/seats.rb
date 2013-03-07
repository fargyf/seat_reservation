# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seat do
    area nil
    type nil
    state nil
    name "MyString"
    position 1
    x_position 1
    y_position 1
    customer_id 1
  end
end
