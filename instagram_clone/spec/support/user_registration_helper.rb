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

  def login
    fill_in 'user[email]', with: 'gwoodman92@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
  end

  def current_user
    User.find_by(email: 'gwoodman92@example.com') if User.first
  end

  def login_and_get_user
    sign_up
    login
    current_user
  end
end
