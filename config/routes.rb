Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "/users/:id", to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'questions#index'
  resources :questions do
    resources :answers, only: [:create]
  end
end
