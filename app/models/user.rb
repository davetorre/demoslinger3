class User < ActiveRecord::Base
  validates :sc_user_name, presence: true, length: { maximum: 50 }
  validates :sc_user_id, presence: true, uniqueness: true
end
