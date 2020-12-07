Rails.application.routes.draw do
  devise_for :users
  get 'user/index'
#get 'welcome/index'
  root 'welcome#index'
# root to: 'home#index'
  resources :users 
    resources :articles do 
     resources :comments
end
  #root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
