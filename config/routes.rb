Rails.application.routes.draw do
  root 'home#index'

  post '/send_email', to: 'home#send_email'
end
