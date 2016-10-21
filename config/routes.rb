Rails.application.routes.draw do
  devise_for :users
  get '/', :to => "home#history", :as => 'activity_summary'
  get 'galleries/new', :to => "galleries#new", :as => 'new_gallery'
  get 'galleries/new/:type', :to => "galleries#new", :as => 'new_gallery_type'
  get 'galleries/content/:parent_id', :to => "galleries#content"
  resources :gallery_files
  resources :gallery_folders
  resources :galleries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
