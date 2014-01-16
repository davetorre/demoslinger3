require 'spec_helper'

describe User do
  
  before  { @user = User.new(sc_user_name: "example", sc_user_id: "12345") }
  subject { @user }
  
  it { should respond_to(:sc_user_name) }
  it { should respond_to(:sc_user_id) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin) }
  it { should respond_to(:microposts) }
  
  it { should be_valid }
  it { should_not be_admin }
  
  describe "when admin is set to true" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  
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
  
  describe "micropost associations" do

    before { @user.save }
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
    end

    it "should destroy associated microposts" do
      microposts = @user.microposts.to_a
      @user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
    end
  end
end
