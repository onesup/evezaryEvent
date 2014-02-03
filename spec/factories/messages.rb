# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sent_at "2014-02-03 05:54:30"
    dest_phone "MyString"
    send_phone "MyString"
    send_name "MyString"
    subject "MyString"
    msg_body "MyText"
    image "MyString"
    user ""
    status "MyString"
  end
end
