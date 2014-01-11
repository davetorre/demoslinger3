require 'spec_helper'

describe User do
  
  before  { @user = User.new(sc_user_name: "example", sc_user_id: "12345") }
  subject { @user }
  
  it { should respond_to(:sc_user_name) }
  it { should respond_to(:sc_user_id) }
  it { should respond_to(:remember_token) }
  
  it { should be_valid }
  
  describe "when sc_user_name is not present" do
    before { @user.sc_user_name = " " }
    it { should_not be_valid }
  end
  
  describe "when sc_user_id is not present" do
    before { @user.sc_user_id = " " }
    it { should_not be_valid }
  end
  
  describe "when sc_user_name is too long" do
    before { @user.sc_user_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when sc_user_id is already taken" do
    before do
      user_with_same_sc_id = @user.dup
      user_with_same_sc_id.save
    end
    it { should_not be_valid }
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
