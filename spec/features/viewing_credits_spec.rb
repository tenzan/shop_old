require 'rails_helper'

RSpec.feature 'Users can view credits' do
  let(:author) { FactoryGirl.create(:user) }

  scenario 'with the credit details' do
    credit = FactoryGirl.create(:credit, amount: 100.50, author: author)

    visit '/credits'
    click_link credit.id
    expect(page.current_url).to eq credit_url(credit)
  end
end