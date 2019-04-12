Rails.application.routes.draw do
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
  # Set the root url
  root 'employees#new'
  

end
