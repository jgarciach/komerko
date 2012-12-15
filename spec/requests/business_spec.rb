require 'spec_helper'

describe "Business" do
  before do
    visit new_business_path
    fill_in "Name", with: "test"
    fill_in "Email", with: "a@test.com"
    click_on "Create Business"
  end
  
  it "can create new business" do
    page.should have_content "created"
  end

  it "can create items through business show" do
  end
end
