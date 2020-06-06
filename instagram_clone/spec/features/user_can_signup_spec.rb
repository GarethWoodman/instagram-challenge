require 'rails_helper'

feature 'User signup', type: :feature do
  scenario 'Fills in form' do
    sign_up
    expect(current_path).to eq '/login'
  end
end
