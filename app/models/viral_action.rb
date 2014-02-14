class ViralAction < ActiveRecord::Base
  belongs_to :user
  scope :web, -> { where(device: "web") }
  scope :mobile, -> { where(device: "mobile") }
  scope :kakao_talk, -> { where(platform: "kakao_talk") }
  scope :kakao_story, -> { where(platform: "kakao_story") }
  scope :facebook, -> { where(platform: "facebook") }
  scope :blog, -> { where(platform: "blog") }
end
