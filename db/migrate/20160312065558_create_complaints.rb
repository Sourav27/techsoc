class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.text :text
      t.string :title
      t.boolean :resolve, default: false
      t.timestamps null: false
    end
  end
end
