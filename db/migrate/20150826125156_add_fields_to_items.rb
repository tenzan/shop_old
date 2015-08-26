class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :shipped_at, :date, default: nil
    add_column :items, :delivered_at, :date, default: nil
  end
end
