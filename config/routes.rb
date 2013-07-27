Friendoc::Application.routes.draw do
  get "welcome/index"

  resources :users 
  resources :photos
  resources :friends
  resources :requests

  get '/renren/login' ,:controller=>"renren",:action=>"login"
  get '/renren/loginnext' ,:controller=>"renren",:action=>"loginnext"
  get '/renren/user' ,:controller=>"renren",:action=>"user"
  get '/login', to:"users#login"
  get '/logout', to: "users#logout"
  get '/upload', to: "photos#new"


  post '/api/signin.json',to:"users#signin"
  get '/api/photos/:uid.json', to:"photos#my"
  get '/api/photos/:uid/city/:city.json', to:"photos#city"
  get '/api/photos/:uid/friends.json', to:"photos#friends"
  get '/api/friendIds/:uid.json', to:"friends#ids"
  get '/api/friendDetails/:uid.json', to:"friends#details"
  get '/api/invitors/:uid.json', to:"requests#invitor"
  get '/api/invitees/:uid.json', to:"requests#invitee"
  get '/api/accept/:uid/with/:fid.json', to:"requests#accept"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
