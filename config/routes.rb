Rails.application.routes.draw do
  root 'event#index'
  resources :events, shallow: true do
    resources :ddays do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
