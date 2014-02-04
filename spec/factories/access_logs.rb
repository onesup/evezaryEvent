# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :access_log do
    location "MyString"
    latitude 1.5
    longitude 1.5
    user ""
    device "MyString"
    ip "MyString"
  end
end
