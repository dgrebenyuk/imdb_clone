require 'rails_helper'

RSpec.describe 'Movies', type: :feature do
  let!(:user) { create(:user) }
  let!(:movie) { create(:movie) }
  context 'Guest User' do
    it 'don\'t show add rating button'  do
      visit '/'
      expect(page).to_not have_selector('i.far.fa-star')
    end
  end

  context 'Registered User' do
    before do
      sign_in user
    end

    it 'should allow user to rate the movie' do
      visit '/'
      expect(page).to have_selector('i.far.fa-star')
    end
  end
end
