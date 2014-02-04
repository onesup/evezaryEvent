require 'csv'

CSV.foreach(Rails.root.join("db", "stores.csv"), headers: true) do |row|
  sleep(1)
  s = Store.create! do |store|
    store.title     = row[0]
    store.phone     = row[1]
    store.address   = row[5]
    store.si        = row[2]
    store.gu        = row[3]
    store.dong      = row[4]
  end
  puts "@@@"s.title+": "+s.latitude.to_s
end
puts "Imported " + Store.count.to_s + " stores"
User.create!(email:"admin@admin.com", password:"mini", name:"관리자", phone:"010-6418-4332")