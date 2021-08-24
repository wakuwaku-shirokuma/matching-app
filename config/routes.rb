Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #ActiveAdmin.routes(self)
  #root to: 'home#index'
  
  # APIコントローラへのルーティング
  #namespace :api, {format: 'json'} do
  #  namespace :v1 do
  #    resources :users, only: [:index, :show]
  #  end
  #end

  resources :users

  #resources :tops
  get '/' => 'top#index'

  #新規登録関連
  get '/entry' => 'registration#entry'
  post '/confirm' => 'registration#confirm'
  post '/thanks' => 'registration#thanks'

end
