Rails.application.routes.draw do
  get 'users/index'

  get '/signup' => 'users#new'

  post 'users' => 'users#create'

  get '/login' => 'users#login'
  post '/loginprocess' => 'users#loginprocess'
  get '/logout' => 'users#logout'
  get '/users/:id/posts' => 'users#posts'
  #========================================================================
  root 'posts#index'
  get 'posts' => 'posts#index'
  #http method "get" 을 보면 보여주기 위함임을 알 수 있다.

  get 'posts/new'

  post 'posts' => 'posts#create'
  #http method "post" 를 보면 보내기위함 을 알수있따

  get 'posts/show'
  get 'posts/:id' => 'posts#show'

  get 'posts/:id/edit' => 'posts#edit'

  put 'posts/:id' => 'posts#update'
  # http method "put"은 유저가 서버로 보낸 데이터를 수정할 때 사용한다.

  delete 'posts/:id' => 'posts#destroy'
  # posts에서 약속을 다 지켰다면 위에 거를 다 주석처리하고 resources :posts를 해도 동일하게 처리된다.

  #========================================================================
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#show'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products냉

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
