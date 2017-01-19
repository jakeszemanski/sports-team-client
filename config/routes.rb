Rails.application.routes.draw do
  get '/teams' => 'teams#index'
  get '/teams/new' => 'teams#new'
  post '/teams' => 'teams#create'
  get '/teams/:id' => 'teams#show'
  get '/teams/:id/edit' => 'teams#edit'
  patch '/teams/:id' => 'teams#update'
  delete '/teams/:id' => 'teams#destroy'
 


end
