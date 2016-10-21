Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get '/', :to => "home#history", :as => 'activity_summary'
  get 'galleries/new', :to => "galleries#new", :as => 'new_gallery'
  get 'galleries/new/:type', :to => "galleries#new", :as => 'new_gallery_type'
  get 'galleries/:parent_id', :to => "galleries#index"
  get 'galleries/show/:id', :to => "galleries#show", :as => "show_gallery"
post 'galleries/delete_items', :to => "galleries#delete_items"
  resources :gallery_files
  resources :gallery_folders
  resources :galleries
  resources :comments
  get 'questionnaires', :to => "questionnaires#index", as: :questionnaires_list
  delete 'questionnaires/:id', :to => "questionnaires#destroy", as: :delete_questionnaire
  get 'questionnaires/:id/edit', :to => "questionnaires#edit", as: :edit_questionnaire
  get 'questionnaires/new', :to => "questionnaires#new", as: :new_questionnaires
  post 'questionnaires/create', :to => "questionnaires#create", as: :create_questionnaire
  patch 'questionnaires/:id/update', :to => "questionnaires#update", as: :update_questionnaire
  # resource 'questionnaires'
  get 'exams/new', :to => "exams#new", as: :new_exams
  post 'exams/create', :to => "exams#create", as: :create_exam
  patch 'exams/update/:id', :to => "exams#update", as: :update_exam
  get 'exams/:id/edit', :to => "exams#edit", as: :edit_exam
  get 'exams/:id', :to => "exams#show", as: :exam_show
  get 'exams', :to => "exams#index", as: :exams
  # resource 'exams'
  delete 'exams/:questionnaire_id' => 'exams#delete_user_attempts', as: :delete_user_exam_attempts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
