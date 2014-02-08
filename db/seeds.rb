require 'csv'

User.create!(email:"admin@admin.com", password:"mini", name:"관리자", phone:"010-6418-4332") if User.find_by_email("admin@admin.com").nil?
Gift.create!(title:"웨딩 패키지", total: 0, code: "1") if Gift.find_by_code("1").nil?
Gift.create!(title:"워커힐 스파", total: 0, code: "2") if Gift.find_by_code("2").nil?
Gift.create!(title:"SK2 화장품 패키지", total: 0, code: "3") if Gift.find_by_code("3").nil?
Gift.create!(title:"피자헛 상품권", total: 0, code: "4") if Gift.find_by_code("4").nil?
Gift.create!(title:"blank", total: 0, code: "5") if Gift.find_by_code("5").nil?

time = Time.now
i = 0
CSV.foreach(Rails.root.join("db", "stores.csv"), headers: true) do |row|

  unless Store.exists?(address:row[5])
    sleep(0.6)
    s = Store.create! do |store|
      store.title     = row[0]
      store.phone     = row[1]
      store.address   = row[5]
      store.si        = row[2]
      store.gu        = row[3]
      store.dong      = row[4]
    end
    puts "[" + i.to_s + "]" + s.title+": " + s.latitude.to_s+"("+Time.at(Time.now - time).utc.strftime("%H:%M:%S").to_s+")"
  end
  puts "[" + i.to_s + "]" + "("+Time.at(Time.now - time).utc.strftime("%H:%M:%S").to_s+")"

  i += 1
end
puts "Imported " + Store.count.to_s + " stores"
puts "total time:" + Time.at(Time.now - time).utc.strftime("%H:%M:%S").to_s
