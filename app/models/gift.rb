class Gift < ActiveRecord::Base
  include DailyCount
  has_many :users
  has_many :messages, through: :users
end
