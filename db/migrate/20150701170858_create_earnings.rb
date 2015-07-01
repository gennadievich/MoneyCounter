class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.date :date
      t.integer :sum
      t.string :category
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
