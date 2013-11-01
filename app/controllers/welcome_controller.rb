class WelcomeController < ApplicationController
  def index
      @questions = Question.order("votes DESC")
  end
  
  def search
  		p params
  		@var = params[:search_term]
        @questions = Question.where('q_title LIKE ?', "%#{@var}%").all
		
        render "search", layout: false
        
  end
end
