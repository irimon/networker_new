NetworkerNew::Application.routes.draw do
  get "update_events/new"

  resources :users do
	resources :basic_profiles
  end 
  
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'static_pages#home'
  get "static_pages/home"

  get "static_pages/help"

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/profile',  to: 'sessions#get_profile'
  match '/connections',  to: 'sessions#get_connections'

  match '/linkedin',  to: 'sessions#linkedin'
  match '/feed', to: 'sessions#get_feed'
  match '/skills', to: 'sessions#get_skill'
  match '/skills_res', to: 'sessions#skills_search'
  match '/due_date_emails', to: 'sessions#get_due_date'
  match '/due_connections_result', to: 'sessions#connections_due_for_update'
  match '/congrats_mail', to: 'sessions#send_congrats_mail'
  #get "sessions/skills_result"
  get "sessions/callback"
  get "sessions/show"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
