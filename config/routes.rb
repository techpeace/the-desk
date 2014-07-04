TheDesk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    get "/calendar" => "calendars#show", :as => :calendar
  end

  resources :courses, only: [:new, :create, :show, :index] do
    get "/standards" => "courses#list_of_standards", :as => :standards
  end

  resources :lessons do
    post "/comments" => "comments#create", :as => :comments

    resources :ratings, only: [:update]
    resources :lesson_standards, only: [:create, :destroy]

    collection do
      get 'calendar'
    end

    resources :deliveries, only: [:create, :destroy]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end