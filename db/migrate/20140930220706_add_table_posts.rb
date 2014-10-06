class AddTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :poster_id, null: false
      t.integer :recipient_id, null: false
      t.string :message

      t.timestamps
    end
  end
end
