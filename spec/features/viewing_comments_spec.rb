require 'rails_helper'

RSpec.feature 'Users can view comments' do
  before do
    shampoo = FactoryGirl.create(:item, name: 'Shampoo', quantity: 3,
                                 unit_price: 100.50, url: 'http://google.com',
                                 note: 'Looking forward!')
    FactoryGirl.create(:comment, item: shampoo, body: 'Ship ASAP!')

    conditioner = FactoryGirl.create(:item, name: 'Conditioner', quantity: 2,
                                     unit_price: 400.50, url: 'http://yahoo.com',
                                     note: 'Not in rush!')
    FactoryGirl.create(:comment, item: conditioner, body: 'When will you ship?')

    visit '/'
  end

  scenario 'for a given item' do
    click_link 'Shampoo'

    expect(page).to have_content 'Ship ASAP!'
    expect(page).not_to have_content 'When will you ship?'

  end
end