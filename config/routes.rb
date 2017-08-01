Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "challenges" do
  	collection do
  		get "dashboard"
  	end
  end

  root 'challenges#index'
  post '/short_url' , to: "challenges#short_url"
  get '/:search', to: "challenges#my_link" # dynamic url route

end