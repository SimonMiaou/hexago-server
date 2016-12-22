Rails.application.routes.draw do
  constraints format: :json do
    resources :games, only: [:show] do
    end
  end
end
