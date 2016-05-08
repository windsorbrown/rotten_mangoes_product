Rails.application.routes.draw do
 
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show] do
  end
  
  namespace :profile do
  	resource :user , only:[:show, :edit]
  end

  resource :session, only: [:new, :create, :destroy]
  
  namespace :admin do
    resources :users  do
    	member do 
    		post :impersonate, :depersonate 
    	end
     end
 end



  root to: 'movies#index'
end
