class Tag < ActiveRecord::Base
  attr_accessible :question_id, :t_content

  belongs_to :question
  validates :t_content, presence: :true
end
