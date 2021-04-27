Rails.application.routes.draw do
 resources :plots, onnly: :index
 resources :plot_plants, only: :destroy
end
