class QuestionsController < ApplicationController

  def index
    @questions = Question.order("updated_at DESC")
  end


  def create
    @question = Question.new(params[:question])
      if @question.save
        redirect_to root_path
      else
        render '/questions/new'
      end
  end


  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

end
