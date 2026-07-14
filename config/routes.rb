Rails.application.routes.draw do
  # lists
  root to: "lists#index"
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  # movies
  get "movies", to: "movies#index"

  # bookmarks
  delete "bookmarks/:id", to: "bookmarks#destroy", as: :bookmark

end
