class WelcomeController < ApplicationController
  def index
      @questions = Question.order("updated_at DESC")
  end
end
