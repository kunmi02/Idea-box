require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:user) do
    User.new(username: 'Johnny', fullname: 'passwordss', photo: 'photoss.com',
             cover_image: 'coverimagess.com', email: 'chech@xhchess.com')
  end
  let(:post) { Idea.create(text: 'Hello!', author: user) }
  let(:post1) { Idea.create(text: '') }

  it 'creates a valid post' do
    expect(post.valid?).to be true
  end

  it 'makes sure idea text is not empty' do
    post.text = ''
    expect(post).not_to be_valid
  end

  it 'makes sure the idea has a user' do
    expect(post1).not_to be_valid
  end
end
