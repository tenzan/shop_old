require 'rails_helper'

RSpec.feature 'Users can view items' do
  let(:author) { FactoryGirl.create(:user) }

  scenario 'with the item details' do
    item = FactoryGirl.create(:item, name: 'Shampoo', quantity: 3,
                              unit_price: 100.50, url: 'http://google.com',
                              note: 'Looking forward!', author: author)

    visit '/'
    click_link 'Shampoo'
    expect(page.current_url).to eq item_url(item)
  end
end