require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    
    it "should have the content 'Bukowski'" do
      visit root_path
      expect(page).to have_content('Bukowski')
    end
  end
  
  describe "About page" do
    
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end
  end
end
