Rails.application.routes.draw do
  
  namespace :api ,defaults: {format: :json} do
    resources :todos
  end

  root to: "static_pages#root"

end


# namespace :admin do
#   resources :articles, :comments
# end