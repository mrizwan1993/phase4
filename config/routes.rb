Rails.application.routes.draw do
  get 'admin_manager_views/index'
  get 'admin_shift_jobs_view/index'
  get 'admin_shifts_view/index'
  get 'admin_jobs_view/index'
  get 'admin_assignments_view/index'
  get 'admin_stores_view/index'
  get 'admin_employees_view/index'
  get 'manager_shift_jobs_view/index'
  get 'manager_shifts_view/index'
  get 'manager_jobs_view/index'
  get 'manager_assignments_view/index'
  get 'manager_employees_view/index'
  get 'manager_stores_view/index'
  get 'manager_flavors/index'
  get 'manager_store_flavors_view/index'
  get 'admin_flavors/index'
  resources :store_flavors
  resources :flavors
  resources :shift_jobs
  resources :jobs
  resources :shifts
  get 'landing/index'
  get 'privacy/index'
  get 'contact/index'
  get 'manager_hub/index'
  get 'employee_hub/index'
  get 'admin_hub/index'
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Generated model routes
  resources :employees
  resources :stores
  resources :assignments
  resources :users
  resources :demos, only: [:new, :create, :destroy]
  
#   # Additional routes we've created for this project
#   get 'proposed' => 'books#proposed', as: :proposed_books
#   get 'contracted' => 'books#contracted', as: :contracted_books
  get 'demos/destroy', to: 'demos#destroy', as: :logout
  get 'employees/:id', to: 'employees#show', as: :view_profile
  # Set the root url
  root 'landing#index'
  

end
