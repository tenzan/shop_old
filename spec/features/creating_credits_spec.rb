require 'rails_helper'

RSpec.feature 'Users can create new credits' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)

    visit credits_url
    click_link 'New Credit'
  end

  scenario 'with valid attributes' do
    fill_in 'Amount', with: 100.00
    click_button 'Create Credit'

    expect(page).to have_content 'Credit has been created.'
  end

  scenario 'with invalid attribute' do
    fill_in 'Amount', with: ''
    click_button 'Create Credit'

    expect(page).to have_content 'Credit has not been created.'
  end

  scenario 'with zero value' do
    fill_in 'Amount', with: 0.00
    click_button 'Create Credit'

    expect(page).to have_content 'Credit has not been created.'
  end

  scenario 'with negative value' do
    fill_in 'Amount', with: -100.00
    click_button 'Create Credit'

    expect(page).to have_content 'Credit has not been created.'
  end

end