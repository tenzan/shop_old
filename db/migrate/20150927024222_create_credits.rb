class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
