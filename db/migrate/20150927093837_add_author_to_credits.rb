class AddAuthorToCredits < ActiveRecord::Migration
  def change
    add_reference :credits, :author, index: true
    add_foreign_key :credits, :users, column: :author_id
  end
end
