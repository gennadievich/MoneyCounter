class User < ActiveRecord::Base
  has_secure_password

  has_many :spendings
  has_many :earnings
end
