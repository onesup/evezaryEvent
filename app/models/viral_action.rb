class ViralAction < ActiveRecord::Base
  belongs_to :user
  scope :pc, -> { where(device: "pc") }
  scope :mobile, -> { where(device: "mobile") }
  scope :kakao_talk, -> { where(platform: "kakao_talk") }
  scope :kakao_story, -> { where(platform: "kakao_story") }
  scope :facebook, -> { where(platform: "facebook") }
  scope :blog, -> { where(platform: "blog") }
  
  def self.temporary_daily_viral_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = ViralAction.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
end
