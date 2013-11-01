require 'spec_helper'

describe AnswersController do
  before :each do
    user = User.create(email: Faker::Internet.email, password: "password",
                     password_confirmation: "password",
                     date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
    session[:user_id] = user.id
  end

  describe "#create" do
    it "on save, new answer should have question id"
  end








end

