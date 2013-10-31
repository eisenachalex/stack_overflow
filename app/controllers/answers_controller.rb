class AnswersController < ApplicationController
  def index
     @question = Question.find(params[:question_id])
     @answer = Answer.new
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end
end
