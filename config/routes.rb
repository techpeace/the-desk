TheDesk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :lessons, only: [:show]
    resources :calendars, only: [:index]
  end

  resources :courses, only: [:new, :create, :show, :index]

  resources :lessons, only: [:show, :new, :create, :update] do
    collection do
      get 'calendar'
    end

    resources :deliveries, only: [:create, :destroy]
  end

  resources :lessons, only: [:show] do
    resources :comments, only: [:index, :create]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end