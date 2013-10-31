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

    it "can login" do
      visit '/'
      within("#login_form") do
        fill_in 'session_email', :with => 'steve@email.com'
        fill_in 'session_password', :with => 'password'
      end
      save_and_open_page
      click_button 'Log in'
    end
  end

  context "When a new user is created, a session is created" do

  end
end
