require 'rails_helper'

RSpec.feature 'User can delete items' do
  let(:author) { FactoryGirl.create(:user) }

  scenario 'successfully' do
    FactoryGirl.create(:item, name: 'Shampoo', quantity: 3,
                       unit_price: 100.50, url: 'http://google.com',
                       note: 'Looking forward!', author: author)

    visit '/'
    click_link 'Shampoo'
    click_link 'Delete Item'

    expect(page).to have_content 'Item has been deleted.'
    expect(page.current_url).to eq items_url
    expect(page).not_to have_content 'Shampoo'
  end
end