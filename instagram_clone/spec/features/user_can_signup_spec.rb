require 'rails_helper'

feature 'User can signup', type: :feature do
  scenario 'a user can signup' do
    visit '/signup'

    expect(page).to have_content 'Sign up'

    fill_in 'user[username]', with: 'gwoodman92'
    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign up'

    expect(current_path).to eq '/login'
  end
end
