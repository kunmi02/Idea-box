# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  before :each do
    @user = User.new(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com', cover_image: 'coverimagess.com', email:'chech@xhchess.com' )
    visit new_user_path
  end

  it 'user can Sign up and it is redirected' do
    fill_in 'Fullname', with: @user.fullname
    fill_in 'Username', with: @user.username
    fill_in 'Photo', with: @user.photo
    fill_in 'Cover image', with: @user.cover_image
    fill_in 'Email', with: @user.email
    click_button 'Register'
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'username can not be empty' do
    fill_in 'Fullname', with: @user.fullname
    fill_in 'Photo', with: @user.photo
    fill_in 'Cover image', with: @user.cover_image
    fill_in 'Email', with: @user.email
    click_button 'Register'
    expect(page).to have_text("Username can't be blank")
  end
  

  it 'email can not be empty' do
    fill_in 'Fullname', with: @user.fullname
    fill_in 'Username', with: @user.username
    fill_in 'Photo', with: @user.photo
    fill_in 'Cover image', with: @user.cover_image
    click_button 'Register'
    expect(page).to have_text("Email can't be blank")
    
  end


  it 'email must be unique' do
    @user2 = User.create(username: 'John1nyyy', fullname: 'passwordssu', photo: 'photoss.com', cover_image: 'coverimagess.com', email:'chech@xhchess.com' )

    fill_in 'Fullname', with: @user.fullname
    fill_in 'Username', with: @user.username
    fill_in 'Photo', with: @user.photo
    fill_in 'Cover image', with: @user.cover_image
    fill_in 'Email', with: @user.email
    click_button 'Register'
    expect(page).to have_text('Email has already been taken')
  end

  it 'username must be unique' do
    @user2 = User.create(username: 'Johnny', fullname: 'passwordssu', photo: 'photoss.com', cover_image: 'coverimagess.com', email:'josh@xhchessre.com' )

    fill_in 'Fullname', with: @user.fullname
    fill_in 'Username', with: @user.username
    fill_in 'Photo', with: @user.photo
    fill_in 'Cover image', with: @user.cover_image
    fill_in 'Email', with: @user.email
    click_button 'Register'
    expect(page).to have_text('Username has already been taken')
  end

end
# rubocop:enable Metrics/BlockLength
