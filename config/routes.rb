require 'sidekiq/web'

PlaylisterRails::Application.routes.draw do

  mount Sidekiq::Web, at: "/sidekiq"

  get "welcome/index"

  resources :artists
  resources :songs
  resources :genres

  resources :playlists
  resources :albums

  resources :webartists
  get "webartists/:id/:id" => 'websongs#show'

  resources :websongs

  root :to => 'welcome#index'

end
