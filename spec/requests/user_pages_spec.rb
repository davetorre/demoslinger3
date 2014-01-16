require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, 
                                    content: "Foo", link: "sound") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user,
                                    content: "Bar", link: "cloud") }

    before { visit user_path(user) }
    it { should have_content(user.sc_user_name) }
    
    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
  end
end
