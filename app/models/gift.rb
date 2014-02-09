class Gift < ActiveRecord::Base
  include DailyCount
  has_many :users
end
