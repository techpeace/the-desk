TheDesk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :lessons, only: [:show]
  end

  resources :lessons, only: [:new] do
    collection do
      get 'calendar'
    end

    resources :deliveries, only: [:create]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end