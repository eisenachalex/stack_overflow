require 'spec_helper'


describe UsersController do
  before :each do
    user = User.create(email: Faker::Internet.email, password: "password",
                     password_confirmation: "password",
                     date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
    session[:user_id] = user.id
  end

  context "with render_views" do
    render_views

    describe "GET new" do
      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end

      it "the new template has a sign up form with an input field email" do
        get :new
        expect(response.body).to match(/input id="user_email"/)
      end
    end

    describe "POST create" do
      it "creates a new user" do
        expect { post :create,
                user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
    end

    describe "GET show" do
      it "renders the show template" do
        @user = stub_model(User)
        User.stub!(:find).and_return(@user)
        get :show, :id => @user.id
        expect(response).to render_template("show")
      end
    end

  end
end
