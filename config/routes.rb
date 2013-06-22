Rapidnomadic2::Application.routes.draw do


  resources :sessions
 # get '/photos/:id' => 'photos#show', :as => 'photo'
 # get '/photos/:id/edit' => 'photos#edit', :as => 'edit_photo'

  post 'photos/:photo_id/comments' => 'comments#create', :as => 'photo_comments'

  scope '/photos/:id' do
    resources :comments, :except => :new
    get '/change' => 'photos#change', :as => 'change_photo'
    get '/photos/:id/comments/new' => 'comments#new', :as => 'new_photo_comment'

  end
  resources :posts
  #scope '/:username' do
    resources :photos #, :except => [:show, :edit, :update]

 # end
  resources :users, :except => :show do
    resources :posts do
      resources :comments
    end
  end

  resources :password_resets

  get 'register' => 'users#new', :as => 'register'

  get 'login' => 'sessions#new', :as => 'login'

  get 'logout' => 'sessions#destroy', :as => 'logout'

#  match '/:username' => 'users#show'
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
   root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
match '/:username' => 'users#show'
end
