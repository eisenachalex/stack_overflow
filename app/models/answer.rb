class Answer < ActiveRecord::Base
  attr_accessible :answer_id, :a_content, :user_id, :question_id, :votes
  belongs_to :user
  belongs_to :question
  has_many :comments


  validates :a_content, presence: :true
end
