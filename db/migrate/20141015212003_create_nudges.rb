class CreateNudges < ActiveRecord::Migration
  def change
    create_table :nudges do |t|
      t.integer :nudger_id
      t.integer :recipient_id
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
