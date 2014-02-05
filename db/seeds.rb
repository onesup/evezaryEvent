require 'csv'
time = Time.now
i = 0
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
  puts "[" + i.to_s + "]" + s.title+": " + s.latitude.to_s
  i += 0
end
puts "Imported " + Store.count.to_s + " stores"
puts "total time:" + (Time.now - time).to_s
User.create!(email:"admin@admin.com", password:"mini", name:"관리자", phone:"010-6418-4332")