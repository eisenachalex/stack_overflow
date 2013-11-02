class TagsController < ApplicationController
  def show
    # render params[:id].inspect
    @tag = Tag.find(params[:id])

    @questions = @tag.questions
  end

end
