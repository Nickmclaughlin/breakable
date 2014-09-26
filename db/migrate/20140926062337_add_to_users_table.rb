class AddToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :profession, :string
    add_column :users, :interests, :text
  end
end
