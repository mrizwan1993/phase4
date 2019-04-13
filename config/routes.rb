Rails.application.routes.draw do
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
  resources :demos, only: [:new, :create, :destroy]
  
#   # Additional routes we've created for this project
#   get 'proposed' => 'books#proposed', as: :proposed_books
#   get 'contracted' => 'books#contracted', as: :contracted_books

  get 'demos/destroy', to: 'demos#destroy', as: :logout
  get 'employees/:id', to: 'employees#show', as: :view_profile
  # Set the root url
  root 'landing#index'
  

end
