require 'spec_helper'
require 'faker'

feature 'User Abilities' do
  context "user should be able to do stuff..." do
    it "can create a new account" do
      visit 'http://localhost:3000/users/new'
      expect {
         fill_in 'user_email',   with: Faker::Internet.email
         fill_in 'user_password', with: "testemail"
         fill_in 'user_password_confirmation', with: "testemail"
         click_button "Create"
       }.to change(User, :count).by(1)
    end

    it "can visit their account and edit a field" do
      #test
    end
  end

  context "When a new user is created, a session is created"
    #test
  end
end
