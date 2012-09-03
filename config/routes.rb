VoterRegistration::Engine.routes.draw do
  
  #scope :module => :voter_registration do
    resources :guidelines, :only => [:index,:show], :as => 'guidelines'

    match '/register', :to => 'register#index', :as => 'register_index'
    post '/register/:state', :to => 'register#create', :as => 'register_create'
    match '/register/:state', :to => 'register#new', :as => 'register_new'
    match '/register/:state/complete', :to => 'register#complete', :as => 'register_complete'

    match '/auth/:provider/callback', to: 'sessions#create'
    match '/auth/failure', to: 'sessions#error'

    match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get

    root :to => 'home#index'
  #end
end
