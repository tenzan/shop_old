class Item < ActiveRecord::Base
  validates :name, :quantity, :unit_price, presence: true
end
