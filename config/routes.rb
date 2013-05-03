Ahorcado::Application.routes.draw do
  resources :words
  resources :games
  
  root to: 'games#index'
end
