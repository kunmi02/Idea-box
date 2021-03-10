require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates user correctly' do
    @user = User.new(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com',
                     cover_image: 'coverimagess.com', email: 'chech@xhchess.com')
    expect(@user.valid?).to be true
  end

  it 'user must have fullname' do
    @user = User.new(username: 'John', email: 'john@mail.com', photo: 'photo.com', cover_image: 'coverimage.com')
    expect(@user.valid?).to be false
  end

  it 'user must have username' do
    @user = User.new(email: 'john@mail.com', photo: 'photo.com', cover_image: 'coverimage.com')
    expect(@user.valid?).to be false
  end

  it 'username must be distinct' do
    @user = User.new(username: 'John')
    @user2 = User.new(username: 'John')
    expect(@user2.valid?).to be false
  end
end
