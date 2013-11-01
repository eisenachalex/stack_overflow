class QuestionsController < ApplicationController

  def index
    @questions = Question.order("votes ASC")

  end
  def create
    @question = Question.new(params[:question])
    @tags = params[:tags][:t_content].scan(/(\w+)/)
    if current_user
      @question.user = current_user
      if @question.save
        @tags.each do |tag|
          @question.tags << Tag.where(t_content: tag[0]).first_or_create
        end
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

  def edit
    @question = Question.find(params[:id])
     end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to user_path
  end

  def destroy
    @question = Question.find(params[:id])
    Answer.delete_all(question_id: @question.id)
    @question.destroy
    redirect_to user_path
  end

end
