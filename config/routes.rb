Soccer::Application.routes.draw do

  resources :players do
    resources :stats
  end
  resources :teams do
    resources :stats
  end
  resources :seasons

  post "upload" => 'upload#import', :as => :upload
  get "upload" => 'upload#form'

  root to: 'static_pages#home'
  match "/home",  to: 'static_pages#home'
  match "/main",  to: 'static_pages#main'
  match "/about", to: 'static_pages#about'
  match "/admin", to: 'static_pages#admin'
  match "/chart", to: "chart#index"

end
