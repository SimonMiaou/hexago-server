Rails.application.routes.draw do
  resources :game, only: [:show] do
  end
end
