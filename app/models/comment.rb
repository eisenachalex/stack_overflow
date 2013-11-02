class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :user_id, :c_content

	belongs_to :user
	belongs_to :answer
end