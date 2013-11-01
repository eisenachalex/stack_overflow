class Tag < ActiveRecord::Base
  attr_accessible :t_content

  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :t_content, presence: :true
end
