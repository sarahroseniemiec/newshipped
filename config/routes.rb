Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  root to: "home#index"

  # telling it to use the controller that I set up that has the new params for the column additions
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :boats
  resources :jobs


  # created a route for associating the boats and jobs needed to have job id and boat id available to me
  post "/jobs/:job_id/boats/:id" => "boat_jobs#create"

  delete "/jobs/:job_id/boats/:id" => "boat_jobs#destroy"

end
