Rails.application.routes.draw do
  root 'home#index'
  resources :tickers, :users
end
