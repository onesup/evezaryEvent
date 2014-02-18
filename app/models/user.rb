class User < ActiveRecord::Base
  include DailyCount
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable# , :registerable,
  belongs_to :gift
  has_many :messages
  has_many :access_logs
  has_many :viral_actions
  geocoded_by :address   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates
      
  def random_code
    evezary = %w(e v e z a r y) * 3
    digit = %w(4 6 7 9) * 2
    code = "e" + evezary.shuffle.join[0..4] + "y-" + digit.shuffle.join[0..3]
    code
  end

  def self.temporary_daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).where.not(phone:nil).count
  end
  def self.temporary_daily_message_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    user_ids = Array.new
    Message.all.each{|x| user_ids << x.user_id}
    count = User.where(id: user_ids).where("users.created_at >= :start_date AND users.created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).where.not(users: {phone:nil}).count
  end
  def self.temporary_daily_viral_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    user_ids = Array.new
    ViralAction.all.each{|x| user_ids << x.user_id}
    viral_users = User.where(id: user_ids)
    count = User.where(id: viral_users).where("users.created_at >= :start_date AND users.created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).where.not(users: {phone:nil}).count
  end

end
