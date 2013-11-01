class TagsController < ApplicationController
  def show
    # render params[:id].inspect
    tag = Tag.find(params[:id])

    @question = tag.question
  end
end
