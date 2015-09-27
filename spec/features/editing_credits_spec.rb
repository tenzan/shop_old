require 'rails_helper'

RSpec.feature 'User can delete credits' do
  let(:author) { FactoryGirl.create(:user) }

  before do
    credit = FactoryGirl.create(:credit, amount: 100.00, author: author)

    visit '/credits'
    click_link credit.id
    click_link 'Edit Credit'
  end

  scenario 'with valid attributes' do
    fill_in 'Amount', with: 200.00
    click_button 'Update Credit'

    expect(page).to have_content 'Credit has been updated.'
    expect(page).to have_content 200.00
  end

  scenario 'with invalid attribute' do
    fill_in 'Amount', with: ''
    click_button 'Update Credit'

    expect(page).to have_content 'Credit has not been updated.'
  end

  scenario 'with zero value' do
    fill_in 'Amount', with: 0.00
    click_button 'Update Credit'

    expect(page).to have_content 'Credit has not been updated.'
  end

  scenario 'with negative value' do
    fill_in 'Amount', with: -100.00
    click_button 'Update Credit'

    expect(page).to have_content 'Credit has not been updated.'
  end

end