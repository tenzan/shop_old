class Item < ActiveRecord::Base
  validates :name, :quantity, presence: true

  belongs_to :author, class_name: 'User'

  has_many :comments, dependent: :delete_all
end
