Rails.application.routes.draw do
  resources :books, only: %i[index]
  get '/books/prime', to: 'books#prime'

  resources :articles, only: %i[index]
end
