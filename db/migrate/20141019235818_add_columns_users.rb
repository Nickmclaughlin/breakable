class AddColumnsUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :string
    add_column :users, :children, :boolean
    add_column :users, :favorites, :string
    add_column :users, :message_me_if, :string
    add_column :users, :looking_for, :string
    add_column :users, :future, :string
  end
end
