require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :system do
  pending "add some examples to (or delete) #{__FILE__}"
  scenario 'index page' do
    puts
    visit "http://localhost:3000/"
    expect(page).to have_content("Tom")
  end
end
