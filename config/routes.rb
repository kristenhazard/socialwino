Socialwino::Application.routes.draw do 
  
  devise_for :users
  
  root :to => "prelaunch_signups#landing"
  
  resources :wineries do
    resources :wines
    resources :tasting_rooms
  end
  
  get "twitter/index"
  get "twitter/authorize"
  get "twitter/finalize"

  resources :regions
  resources :varietals
  
  namespace :user do
    root :to => "wineries#index"
  end
  
  resources :users
  
  # match '/user' => 'users#index'
  
  get "wineries/:id/billboard" => "billboard#index"
  
  get "billboard/index"
  match "billboard", :to => "billboard#index"
  # get "billboard/show_demo"
  # match "billboard/demo", :to => "billboard#show_demo"
  # get "billboard/update_tweets"
  # match "billboard/update/:id", :to => "billboard#update_tweets"
  get "wineries/:id/billboard/initialize_tweets" => "billboard#initialize_tweets"
  # get "billboard/new_tweets"

  # resources :user_sessions
  resources :prelaunch_signups do
    new do
      get :winemaker
    end
  end
  
  # match 'login', :to => "user_sessions#new"
  # match 'logout', :to => "user_sessions#destroy"

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
