class AddRememberTo < ActiveRecord::Migration
  def change
  	add_column :users, :password_digest, :string
  	add_column :users, :remember_digest, :string
  end
end
