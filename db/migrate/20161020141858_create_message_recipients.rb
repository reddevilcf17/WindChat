class CreateMessageRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :message_recipients do |t|
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
