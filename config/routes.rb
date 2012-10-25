TripodMetricsV1::Application.routes.draw do




  resources :dispositivos, only: [:show,:index, :new, :create, :destroy]  do
    resources :rates
  end

  resources :usuarios
  resources :calificador
  resources :static_pages
  resources :logins, only: [:new, :create, :destroy]

  match '/contact2', to: 'calificador#personal'
  #match '/create', to: 'calificador#calificar', via: :get
  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/payments/relay_response', :to => 'payments#relay_response', :as => 'payments_relay_response', :via => [:post]
  match '/payments/receipt', :to => 'payments#receipt', :as => 'payments_receipt', :via => [:get]


  root :to => 'static_pages#home'

  match '/rateservice/:device/:id', to: 'calificador#calificador'
  match '/newrate', to: 'rates#new'
  match '/rate', to: 'rates#index'
  match '/rate/add_entry', to: 'rates#add_entry'

  match '/signin', to: 'logins#new'
  match '/signout', to: 'logins#destroy', via: :delete
  match '/new', to: 'usuarios#new'
  match '/reports', to: 'usuarios#reports'
  match '/report_excel', to: 'usuarios#report_excel'
  match '/index', to: 'usuarios#index'
  match '/contacto', to: 'static_pages#contacto'
  match '/help', to: 'static_pages#help'
  match '/create', to: 'rates#create', via: :get
   # map.create_rates 'rates/create', :controller => 'rates', :action=> 'create', :conditions =>{:method => :get}


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mindx you can assign values other than :controller and :action

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
