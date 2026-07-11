Rails.application.routes.draw do
  # lists
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  # movies
  get "movies", to: "movies#index"

  # bookmarks
  delete "bookmarks/:id", to: "bookmarks#destroy"

end
