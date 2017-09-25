Rails.application.routes.draw do
  root   'sessions#new'
 
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 
  resources :users  do
    member do
      get 'user_home'
      get 'admin_home'
    end 
    resources :articles do
      collection do
        get 'user_articles'
      end
      member do
        post 'request_status'
        post 'approved_article'
        post 'deny_article'
        get 'show_approved_articles'
        get 'like'
       
      end 
      resources :comments do
        resources :replies
      end   
    end

  end

  namespace :articles do
    get 'list_of_requested_articles'
    get 'list_of_approved_articles'
  end



end
