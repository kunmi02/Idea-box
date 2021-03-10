require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:user) do
    User.new(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com',
             cover_image: 'coverimagess.com', email: 'chech@xhchess.com')
  end
  let(:user2) do
    User.new(username: 'Johnwny', fullname: 'pwasswordss', photo: 'wphotoss.com',
             cover_image: 'coverimagess.wcom', email: 'chech@xhwchess.com')
  end
  it 'creates a valid user following' do
    follower = Following.create(follower_id: user, followed_id: user2)
    expect(follower.valid?).to be true
  end
end
