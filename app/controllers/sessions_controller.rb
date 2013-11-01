class SessionsController < ApplicationController

  def new
      @user = User.find_by_email(params[:session][:email])
      p @user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
    else
      user = User.new :name => auth_hash["user"]["name"], :email => auth_hash["user"]["email"]
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      user.save
  
      render :text => "Hi #{user.name}! You've signed up."
    end
  end 

  def destroy
    session.clear
    redirect_to root_path
  end


end
