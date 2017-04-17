class User < ActiveRecord::Base
  
  has_many :reviews
  has_many :line_items
  has_secure_password
  
end
