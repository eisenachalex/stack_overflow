class WelcomeController < ApplicationController
  def index
      @questions = Question.order("votes DESC")
  end
end
