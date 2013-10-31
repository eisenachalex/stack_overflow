class QuestionsController < ApplicationController

  def index
    @questions = Question.order("updated_at DESC")
  end


  def create
    @question = Question.new(params[:question])
    if current_user
      @question.user = current_user
      if @question.save
        redirect_to root_path
      else
        render '/questions/new'
      end
    else
      redirect_to new_user_path
    end
  end


  def new
    if current_user
    @question = Question.new
    else
      redirect_to new_user_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

end
