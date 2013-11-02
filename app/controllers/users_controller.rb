class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if params[:photo]
      @user.photo = Photo.create(file: params[:photo][:file])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if params[:photo]
      @user.photo = Photo.create(file: params[:photo][:file])
    end
    redirect_to user_path
  end

end
