# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store, :class => 'Stores' do
    title "MyString"
    address "MyString"
    phone "MyString"
    lat 1.5
    lng 1.5
    total 1
  end
end
