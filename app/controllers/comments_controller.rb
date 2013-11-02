class CommentsController < ApplicationController
	def index
	end
	
	def new
		if current_user
		@answer = Answer.find(params[:answer_id])
		@comment = Comment.new
		else
		redirect_to new_user_path
		end
	end
	
	def edit
		@comment = Comment.find(params[:id])	
	end
	
	def create
		@answer = Answer.find(params[:answer_id])
		@question = Question.find(@answer.question_id)
		@comment = Comment.new(user_id: current_user.id, answer_id: @answer.id, c_content:(params[:comment][:c_content]))
		if @comment.save
		 redirect_to question_path(@question)
		else
			redirect_to user_path(current_user)
		end
	end
		
 	def update
    	@comment = Comment.find(params[:id])
    	@comment.update_attributes(params[:comment])
    	redirect_to user_path
    end
	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to user_path
	end
end