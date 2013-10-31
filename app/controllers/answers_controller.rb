class AnswersController < ApplicationController
  def index
     @question = Question.find(params[:question_id])
     @answer = Answer.new
  end


  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    @answer.question_id = @question.id

    if current_user
      @answer.user = current_user
      if @answer.save
        redirect_to question_path(@question, @answer)
      else
        render '/question'
      end
    else
      redirect_to new_user_path
    end
  end


  def show
    p "params #{params}"
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to user_path
  end


end
