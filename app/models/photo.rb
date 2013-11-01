class Photo < ActiveRecord::Base
  attr_accessible :file, :user_id

  belongs_to :user
  mount_uploader :file, Uploader
end
