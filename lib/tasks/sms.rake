namespace :sms do
  task :send => :environment do
    Message.send_mms(User.last)
  end
end