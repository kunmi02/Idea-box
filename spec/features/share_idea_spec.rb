require 'rails_helper'

RSpec.feature 'ShareIdea', type: :feature do
  before :each do
    @user = User.create(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com',
                        cover_image: 'coverimagess.com', email: 'chech@xhchess.com')
    visit root_path
    fill_in 'username', with: @user.username
    click_button 'Login'
    @idea = Idea.new(author: @user, text: 'Hello!')
    visit ideas_path
  end

  it 'user can share an idea' do
    fill_in 'idea', with: @idea.text
    click_button 'Share'
    expect(page).to have_text('Idea successfully shared')
  end
end
