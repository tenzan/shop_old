class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :unit_price
      t.string :url
      t.text :note

      t.timestamps null: false
    end
  end
end
