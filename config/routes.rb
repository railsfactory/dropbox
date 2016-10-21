Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'galleries/new', :to => "galleries#new", :as => 'new_gallery'
  get 'galleries/new/:type', :to => "galleries#new", :as => 'new_gallery_type'
  resources :gallery_files
  resources :gallery_folders
  resources :galleries
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
