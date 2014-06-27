TheDesk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :lessons, only: [:show]
    get "/calendar" => "calendars#show", :as => :calendar
  end

  resources :courses, only: [:new, :create, :show, :index]

  resources :lessons, only: [:show, :new, :create, :update] do
    post "/comments" => "comments#create", :as => :comments

    collection do
      get 'calendar'
    end

    resources :deliveries, only: [:create, :destroy]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end