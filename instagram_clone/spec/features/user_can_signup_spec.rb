require 'rails_helper'

feature 'User signup', type: :feature do
  scenario 'Fills in form' do
    visit '/signup'

    expect(page).to have_content 'Create account'

    fill_in 'user[username]', with: 'gwoodman92'
    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create account'

    expect(current_path).to eq '/login'
  end
end
