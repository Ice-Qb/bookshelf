Rails.application.routes.draw do
  resources :books, only: %i[index]
  get '/books/prime', to: 'books#prime'
end
