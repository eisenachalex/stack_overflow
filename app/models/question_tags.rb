class QuestionTags < ActiveRecord::Base
  attr_accessible :question_id, :tag_id

  belongs_to :tag
  belongs_to :question
end
