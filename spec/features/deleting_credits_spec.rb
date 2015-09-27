require 'rails_helper'

RSpec.feature 'Users can delete credits' do
  let(:author) { FactoryGirl.create(:user) }

  before do
    visit '/credits'
  end

  scenario 'successfully' do
    credit = FactoryGirl.create(:credit, amount: 100.00, author: author)
    visit '/credits'
    click_link credit.id
    click_link 'Delete Credit'
    expect(page).to have_content 'Credit has been deleted.'
    expect(page.current_url).to eq credits_url
    expect(page).not_to have_content credit.id
  end
end