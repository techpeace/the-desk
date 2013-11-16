TheDesk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :lessons, only: [:new] do
    collection do
      get 'calendar'
    end
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end