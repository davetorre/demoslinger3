class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  validates :sc_user_name, presence: true, length: { maximum: 50 }
  validates :sc_user_id, presence: true, uniqueness: true
  
  before_create :create_remember_token
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
