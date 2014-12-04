Rails.application.routes.draw do
  post '/checkins', to: 'checkins#create'

  get 'tmdb/search'

  root 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/info', to: 'sessions#info'

  get '/map', to: 'home#map'
  get '/terms', to: 'home#terms'

  get '/tmdb/search', to: 'tmdb#search'
end
