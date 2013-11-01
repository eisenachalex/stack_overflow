require 'spec_helper'

describe QuestionsController do
  before :each do
    user = User.create(email: Faker::Internet.email, password: "password",
                     password_confirmation: "password",
                     date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
    session[:user_id] = user.id
    @question = Question.create(user_id: rand(1..10), q_content: Faker::Company.bs,
                                 q_title: Faker::Company.catch_phrase, votes: rand(1..10))
    @answer = Answer.create(question_id: rand(1..10), user_id: rand(1..10),
                            a_content: Faker::Company.catch_phrase, votes: rand(1..10))
  end


context "with render_views" do
    render_views

    describe "GET index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "can click on a question title to go to that question's page" do
        visit root_path
        click_link @question.q_title
        page.should have_content(@question.q_title)
      end
    end

    describe "GET new" do
      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end

      it "the new template has a question form" do
        get :new
        expect(response.body).to match(/id="question_q_content"/)
      end
    end

    describe "POST create" do
      it "creates a new question" do
        expect { post :create,
                question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end
    end

    describe "GET show" date_of_birth
      it "renders the show template" do
        @question = stub_model(Question)
        Question.stub!(:find).and_return(@question)
        get :show, :id => @question.id
        expect(response).to render_template("show")
      end
    end

    # describe "DELETE destroy" do
    #   it "allows a user to destroy their created question" do
    #     expect { delete :destroy, @question }.to change(Question, :count).by(1)
    #   end
    # end

  end
end


