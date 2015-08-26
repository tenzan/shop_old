class Item < ActiveRecord::Base
  validates :name, :quantity, presence: true

  has_many :comments, dependent: :delete_all
end
