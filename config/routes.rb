PdkTeamSite::Application.routes.draw do
  get "rvsps/index"

  get "rvsps/attend"

  get "rvsps/maybe"

  get "rvsps/not"


  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  # Didn't get the polymorphic_link in calendar_helper.rb to work so I solved it like this
  match '/events(/:id)' => 'activities#show', :as => :activity, :constraints => {:id => /\d/}
  
  # temporary root until I have a start page
  root :to => 'wall_posts#index'


  # Trying to hook up rvsps "under" activities
  match "profile" => "users#show"
  match '/activities/:activity_id/rvsps/attend/:user_id' => 'rvsps#attend'
  match '/activities/:activity_id/rvsps/maybe/:user_id' => 'rvsps#maybe'
  match '/activities/:activity_id/rvsps/not/:user_id' => 'rvsps#not'
  match '/activities/:activity_id/rvsps/index/' => 'rvsps#index' 
  #match '/:controller/:activity_id/rvsps/:action/:user_id' => 'rvsps#index' # mappar tydligen bara mot show action->/:controller/:activity_id/rvsps/:action/:user_id(.:format) {:controller=>"rvsps", :action=>"index"} -> http://localhost:3000/activities/2/rvsps/index/2
  #match '/:controller/:activity_id/rvsps/:action/:user_id' => 'rvsps#index'
  #match '/activities(/:activity_id)/rvsps(/:action)'
  resources :activities do
    resources :rvsps
  end

  resources :wall_posts

  resources :users do
    member do
      get 'approve'
    end
  end

  resources :user_sessions

  match 'forum' => 'wall_posts#index', :as => :forum
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout



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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
