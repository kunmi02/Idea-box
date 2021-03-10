require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  before :each do
    @user = User.create(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com',
                        cover_image: 'coverimagess.com', email: 'chech@xhchess.com')
    visit root_path
  end

  it 'user can login and it is redirected' do
    fill_in 'username', with: @user.username
    click_button 'Login'
    expect(page).to have_text('Log in successful')
  end

  it 'wrong user can not login' do
    fill_in 'username', with: 'tmlord'
    click_button 'Login'
    expect(page).to have_text('User not found')
  end
end
