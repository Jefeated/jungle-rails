class User < ActiveRecord::Base
  
  has_many :line_items
  has_secure_password
  
end
