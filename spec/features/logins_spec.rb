require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  context "logging in" do
    Steps "For logging in" do
      Given "I visit the registration page" do
        visit "/"
      end
      Then "I can register as a user" do
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
      Then "I can go to the login page" do
        visit '/users/login'
      end
      And "I can enter incorrect credentials" do
        fill_in "user_id", with: "hello"
        fill_in "password", with: "person"
        click_button "Login"
      end
      Then "I can see an alert on the login page" do
        expect(page).to have_content("Log in failed, try again.")
      end
      Then "I can enter my correct credentials" do
        fill_in "user_id", with: "jdirt"
        fill_in "password", with: "hemi"
        click_button "Login"
      end
      Then "I am taken to a page that says 'hello, username' and my registration information" do
        expect(page).to have_content("Hello, jdirt")
        expect(page).to have_content("Full Name: Joe Dirt")
        expect(page).to have_content("Street Address: 123 Trailer Drive")
        expect(page).to have_content("City: Silver Town")
        expect(page).to have_content("State: California")
        expect(page).to have_content("Postal Code: 12345")
        expect(page).to have_content("Country: USA")
        expect(page).to have_content("Email: joedirt@dirt.com")
      end
    end
  end
end
