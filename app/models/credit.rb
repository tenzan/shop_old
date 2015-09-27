class Credit < ActiveRecord::Base
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :author, class_name: 'User'
end
