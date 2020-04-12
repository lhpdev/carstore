Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicles, path: 'home', only: [:index]
  get '/', to: redirect('/home')
end
