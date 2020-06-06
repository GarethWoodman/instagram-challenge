require 'rails_helper'

feature 'User login and logout', type: :feature do
  scenario 'User logs in' do
    sign_up
    expect(page).to have_content 'Login'

    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    user = User.find_by(email: 'gwoodman92@example.com')

    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content "#{user.username}"
  end

  # scenario 'User logs out' do
  #   visit '/signup'
  #
  #   expect(page).to have_content 'Create account'
  #
  #   fill_in 'user[username]', with: 'gwoodman92'
  #   fill_in 'user[email]', with: 'gwoodman92@example.com'
  #   fill_in 'user[password]', with: 'password'
  #   fill_in 'user[password_confirmation]', with: 'password'
  #   click_button 'Create account'
  #
  #   expect(current_path).to eq '/login'
  # end
end
