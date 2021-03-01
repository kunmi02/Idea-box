require 'rails_helper'

RSpec.describe User, type: :model do 
  it 'creates user correctly' do
    @user = User.new(username: 'John', fullname: 'password', photo: 'photo.com', cover_image: 'coverimage.com', email:'chech@xhche.com' )
    expect(@user.valid?).to be false
  end

  # it 'user must have fullname' do
  #   @user = User.new(username: 'John', email: 'john@mail.com', photo: 'photo.com', cover_image: 'coverimage.com', )
  #   expect(@user.valid?).to be false
  # end

  # it 'user must have username' do
  #   @user = User.new(email: 'john@mail.com', photo: 'photo.com', cover_image: 'coverimage.com', )
  #   expect(@user.valid?).to be false
  # end

  # it 'username must be distinct' do
  #   @user = User.new(username: 'John', email: 'john@mail.com', fullname: 'password', photo: 'photo.com', cover_image: 'coverimage.com' )
  #   @user2 = User.new(username: 'John', email: 'john@mal.com', fullname: 'passord', photo: 'phto.com', cover_image: 'covermage.com' )

  #   expect(@user.valid?).to be false
  # end
end
