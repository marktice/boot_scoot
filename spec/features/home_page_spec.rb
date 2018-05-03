require 'rails_helper'

feature 'home page' do
  let(:user) { FactoryBot.create(:user) }
  # before { sign_in user }
  # before { login_as(user, :scope => :user) }
    
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end