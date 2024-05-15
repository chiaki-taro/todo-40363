Rails.application.routes.draw do
  root to: 'todos#index'
  post '/todos/:id/done' => 'todos#done',   as: 'done'
  resources :todos
end