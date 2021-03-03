class Following < ApplicationRecord
  validates_uniqueness_of :follower_id, scope: [:followed_id]

  belongs_to :follower, class_name: 'User', optional: true
  belongs_to :following, class_name: 'User', optional: true
end
