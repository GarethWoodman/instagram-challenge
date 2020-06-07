require 'rails_helper'

feature 'User login and logout', type: :feature do
  scenario 'User logs in and then logs out' do
    sign_up
    expect(page).to have_content 'Login'
    expect(page).to have_link 'Sign up'

    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    user = User.find_by(email: 'gwoodman92@example.com')

    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content "#{user.username}"

    click_button 'Log out'
    expect(current_path).to eq "/login"
  end
end
