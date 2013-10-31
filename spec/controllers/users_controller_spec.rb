require 'spec_helper'


describe UsersController do
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

  end
end
