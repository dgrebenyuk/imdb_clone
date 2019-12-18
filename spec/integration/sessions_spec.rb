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
end
