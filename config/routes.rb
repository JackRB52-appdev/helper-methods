Rails.application.routes.draw do
  root "movies#index" 

  # Routes for the Movie resource:
  resources :movies

  # # CREATE
  # post "/movies" => "movies#create", as: :movies
  # get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path
          
  # # READ
  # get "/movies" => "movies#index" #don't need name as have method naming it above
  # get "/movies/:id" => "movies#show", as: :movie # movie_path() expecas an argument to populate id segment
  
  # # UPDATE
  # patch "/movies/:id" => "movies#update"
  # get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path(expects arg to populate id)
  
  # # DELETE
  # delete "/movies/:id" => "movies#destroy"

  #------------------------------
end
