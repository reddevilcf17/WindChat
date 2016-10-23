class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :message_type
      t.text :content
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
