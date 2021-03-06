class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :link, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
end
