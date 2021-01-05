Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy] #TA question: Why is this singular not plural???

end
