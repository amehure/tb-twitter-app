Rails.application.routes.draw do
  resources :events do
    resources :ddays do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
