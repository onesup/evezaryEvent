class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable# , :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
end
