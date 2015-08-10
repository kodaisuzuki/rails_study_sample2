require 'rails_helper'

RSpec.describe "Items", :type => :request do
  describe "GET /items" do
    it "works! (now write some real specs)" do
      visit '/sample1/items'
      expect(page).to have_content('メモ')
    end
  end
end
