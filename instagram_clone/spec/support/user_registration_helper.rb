module UserHelper
  def sign_up
    visit '/signup'

    expect(page).to have_content 'Create account'

    fill_in 'user[username]', with: 'gwoodman92'
    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create account'
  end
end
