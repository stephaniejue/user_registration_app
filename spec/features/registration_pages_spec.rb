require 'rails_helper'

RSpec.feature "RegistrationPages", type: :feature do
  context "Registration page" do
    Steps "Goingn to the Registation page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Register" do
        expect(page).to have_content("register")
      end
      Then "I can fill out my registration info" do
        fill_in 'name', with: 'Joe Dirt'
        fill_in 'address', with: '123 Trailer Drive'
        fill_in 'city', with: 'Silver Town'
        fill_in 'state', with: 'California'
        fill_in 'postal_code', with: '12345'
        fill_in 'country', with: 'USA '
        fill_in 'email', with: 'joedirt@dirt.com'
        fill_in 'phone_home', with: '6196196119'
        fill_in 'phone_cell', with: '1234567890'
        fill_in 'phone_work', with: '9876543210'
        fill_in 'user_id', with: 'jdirt'
        fill_in 'password', with: 'hemi'
      end
    end
  end
  context "Registering a user" do
    Steps "For registering a user" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I can fill out my registration info" do
        fill_in 'name', with: 'Joe Dirt'
        fill_in 'address', with: '123 Trailer Drive'
        fill_in 'city', with: 'Silver Town'
        fill_in 'state', with: 'California'
        fill_in 'postal_code', with: '12345'
        fill_in 'country', with: 'USA '
        fill_in 'email', with: 'joedirt@dirt.com'
        fill_in 'user_id', with: 'jdirt'
        fill_in 'password', with: 'hemi'
        click_button 'Register'
      end
      Then "I am taken to a confirmation page" do
        expect(page).to have_content("jdirt")
        expect(page).to have_content("hemi")
      end
    end
  end
end
