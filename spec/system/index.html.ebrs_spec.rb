require 'rails_helper'

RSpec.describe "Index.html.ebrs", type: :system do
  before do
    driven_by(:rack_test)
  end
  it "simple test" do
    visit users_path
    expect(page).to have_content("Tom")
  end
  pending "add some scenarios (or delete) #{__FILE__}"
end
