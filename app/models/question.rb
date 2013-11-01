class Question < ActiveRecord::Base
  attr_accessible :q_title, :q_content, :user_id, :votes

  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :q_title, presence: :true
  validates :q_content, presence: :true
end

