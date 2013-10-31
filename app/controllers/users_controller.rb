class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render text: params[:user].inspect
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
    else
      redirect_to new_user_path
    end
  end
end
