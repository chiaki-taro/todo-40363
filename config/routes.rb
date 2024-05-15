Rails.application.routes.draw do
  devise_for :users
  root to: 'todos#index'
  post '/todos/:id/done' => 'todos#done',   as: 'done'
  resources :todos
end