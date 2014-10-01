class AddTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: :false
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
