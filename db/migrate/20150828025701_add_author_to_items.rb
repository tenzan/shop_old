class AddAuthorToItems < ActiveRecord::Migration
  def change
    add_reference :items, :author, index: true
    add_foreign_key :items, :users, column: :author_id
  end
end
