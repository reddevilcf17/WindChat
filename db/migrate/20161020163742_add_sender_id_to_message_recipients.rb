class AddSenderIdToMessageRecipients < ActiveRecord::Migration[5.0]
  def change
    add_column :message_recipients, :sender_id, :integer, index: true
  end
end
