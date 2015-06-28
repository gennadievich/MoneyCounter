class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.integer :sum
      t.string :category
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
