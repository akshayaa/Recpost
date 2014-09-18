Rails.application.routes.draw do
  
   root to: "posts#index"

   get 'about' => 'home#about'
   get 'signout' => 'sessions#destroy'
   get 'welcome' => 'home#welcome'

   resources :users

   resources :sessions

   resources :posts do 
      resources :comments
   end

end
