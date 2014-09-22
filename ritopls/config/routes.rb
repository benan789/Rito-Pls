Ritopls::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'champions#index'

  post '/find' => 'users#find'
  post '/finduser' => 'users#userfind'
  post '/login' => 'sessions#create'
  post '/signup' => 'users#create'
  post '/votebalanced' => 'champions#votebalanced'
  post '/votebuff' => 'champions#votebuff'
  post '/votenerf' => 'champions#votenerf'
  post '/voterework' => 'champions#voterework'
  post '/votevupdate' => 'champions#votevupdate'
  post '/fingerprint' => 'fingerprints#fingerprint'
  post '/comment' => 'comments#create'
  post '/edit' => 'champions#show'


  get 'champions/balanced' => 'champions#balanced', as: :balanced
  get 'champions/buff' => 'champions#buff', as: :buff
  get 'champions/nerf' => 'champions#nerf', as: :nerf
  get 'champions/rework' => 'champions#rework', as: :rework
  get 'champions/vupdate' => 'champions#vupdate', as: :vupdate
  get 'champions/:id' => 'champions#show', as: :champion
  get 'comments/:id/edit' => 'comments#edit', as: :edit_comment
  patch 'comment/:id' => 'comments#update', as: :comment_update
  # resources :sessions
  delete 'comments/:id' => 'comments#destroy', as: :destroy
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
