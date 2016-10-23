Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create_with_facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  resources :relationships
  resources :message_recipients
  resources :messages
	root 'sessions#login'
	resources :sessions, only: [:create]
	get 'login' => 'sessions#login'
	delete 'logout' => 'sessions#destroy'
  	resources :users
  	get 'messages_page' => 'users#show_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
