class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :profile_photo, default: false
      t.string :photo
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
