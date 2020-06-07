require 'rails_helper'

feature 'User can add photos', type: :feature do
  scenario 'User adds a photo' do
    user = login_and_get_user

    click_button 'Post picture'
    #expect(page).to have_css('.picture_post')
  end
end
