class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string :rollno
	  t.string :hostel
	  t.string :name
      t.string :email
      t.timestamps null: false
    end
    add_index :users, :rollno, unique: true
  end
end
