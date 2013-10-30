class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :password, :website
end
