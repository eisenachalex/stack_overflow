class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render text: params[:user].inspect
    @user = User.new(params[:user])

    if params[:photo]
      params[:photo].each do |k, v|
        @user.photo << Photo.create(file :v)
      end
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    @questions = Question.where(user_id: @user.id)
    @answers = Answer.where(user_id: @user.id)
  end

end
