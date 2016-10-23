OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1417317391630307', '59e1964da79b8aed1555d6556eb4a6e7', :scope => 'email', :display => 'popup', :info_fields => 'name,email'
end