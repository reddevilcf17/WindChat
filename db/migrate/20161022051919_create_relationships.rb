class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.integer :relationship_status
      t.integer :action

      t.timestamps
    end
  end
end
