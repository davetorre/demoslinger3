require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Help me finish this song.", 
                    link: "https://soundcloud.com/dave_torre/novtwo-111311")
  end 
                  
  subject { @micropost }
  
  it { should respond_to(:content) }
  it { should respond_to(:link) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }
  
  describe "when user id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when content is blank" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end
  
  describe "when content is too long" do
    before { @micropost.content = "a" * 201 }
    it { should_not be_valid }
  end
  
  describe "when link is blank" do
    before { @micropost.link = " " }
    it { should_not be_valid }
  end
  
  describe "when link is too long" do
    before { @micropost.link = "a" * 101 }
    it { should_not be_valid }
  end
end
