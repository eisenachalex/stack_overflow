class Answer < ActiveRecord::Base
  attr_accessible :answer_id, :a_content, :user_id, :question_id, :votes
  belongs_to :user
  belongs_to :answer
end
