require 'rails_helper'

RSpec.describe "User registration and login", type: :feature do
  let(:user) { create(:user) }

  context 'Login' do
    it "login user with correct credentials" do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'Password1'
      click_button 'Log in'
      expect(page).to have_content user.email
    end

    it "login failure for wrong credentials" do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'test'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end

  context 'Registration' do
    it 'should validate fields presence' do
      visit '/users/sign_up'
      click_button 'Sign up'
      expect(page).to have_content 'Email can\'t be blank'
      expect(page).to have_content 'Password can\'t be blank'
    end

    it 'should create new user and redirect to home page' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'johndoe@test.com'
      fill_in 'Password', with: 'pass123'
      fill_in 'Password confirmation', with: 'pass123'
      click_button 'Sign up'
      expect(page).to have_content 'Movies'
      expect(page).to have_content 'johndoe@test.com'
    end
  end
end
