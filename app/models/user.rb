class User < ApplicationRecord
  has_many :ideas, foreign_key: :author_id
  has_many :following
  has_many :followers, class_name: 'Following', dependent: :destroy, foreign_key: :follower_id
  has_many :followings, class_name: 'Following', dependent: :destroy, foreign_key: :followed_id
  has_many :shared_ideas, class_name: 'Idea', dependent: :destroy, foreign_key: :author_id

  validates :username, presence: true, length: { minimum: 3, maximum: 10 }
  validates :email, presence: true, length: { minimum: 3, maximum: 30 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 30 }
  validates_uniqueness_of :username
  validates_uniqueness_of :email
end
