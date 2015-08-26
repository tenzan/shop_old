require 'rails_helper'

RSpec.feature 'Users can edit existing items' do
  before do
    FactoryGirl.create(:item, name: 'Shampoo', quantity: 3,
                       unit_price: 100.50, url: 'http://google.com',
                       note: 'Looking forward!')

    visit '/'
    click_link 'Shampoo'
    click_link 'Edit Item'
  end

  scenario 'with valid attribute Name' do
    fill_in 'Name', with: 'Shampoo New'
    click_button 'Update Item'

    expect(page).to have_content 'Item has been updated.'
    expect(page).to have_content 'Shampoo New'
  end

  scenario 'with valid attribute Quantity' do
    fill_in 'Quantity', with: 5
    click_button 'Update Item'

    expect(page).to have_content 'Item has been updated.'
    expect(page).to have_content '5'
  end

  scenario 'with valid attribute Unit price' do
    fill_in 'Unit price', with: 200.5
    click_button 'Update Item'

    expect(page).to have_content 'Item has been updated.'
    expect(page).to have_content '200.5'
  end

  scenario 'when providing empty name' do
    fill_in 'Name', with: ''
    click_button 'Update Item'

    expect(page).to have_content 'Item has not been updated.'
  end

  scenario 'when providing empty quantity' do
    fill_in 'Quantity', with: ''
    click_button 'Update Item'

    expect(page).to have_content 'Item has not been updated.'
  end

  scenario 'when providing empty unit price' do
    fill_in 'Unit price', with: ''
    click_button 'Update Item'

    expect(page).to have_content 'Item has not been updated.'
  end

end