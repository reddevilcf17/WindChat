class Message < ApplicationRecord
  belongs_to :user
  has_many :message_recipients
end
