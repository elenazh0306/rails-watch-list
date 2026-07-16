Rails.application.routes.draw do
  # lists
  root to: "lists#index"
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  # movies
  get "movies", to: "movies#index"
  get "movies/:movie_id/bookmarks/new", to: "bookmarks#movienew", as: :new_movie_bookmark
  post "movies/:movie_id/bookmarks", to: "bookmarks#moviecreate", as: :movie_bookmarks

  # bookmarks
  delete "bookmarks/:id", to: "bookmarks#destroy", as: :bookmark

end
