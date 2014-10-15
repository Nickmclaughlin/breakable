class AddColumnResponses < ActiveRecord::Migration
  def change
    add_column :responses, :poster_id, :integer
    add_column :responses, :recipient_id, :integer
  end
end
