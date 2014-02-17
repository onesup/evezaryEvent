class ViralAction < ActiveRecord::Base
  belongs_to :user
  scope :pc, -> { where(device: "pc") }
  scope :mobile, -> { where(device: "mobile") }
  scope :kakao_talk, -> { where(platform: "kakao_talk") }
  scope :kakao_story, -> { where(platform: "kakao_story") }
  scope :facebook, -> { where(platform: "fb") }
  scope :blog, -> { where(platform: "blog") }
end
