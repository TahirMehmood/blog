Rails.application.routes.draw do

  #resources :comments

  get 'rental/index'

  get 'movie/:id/mail' => "movies#mail", :as => "movie_mail"
  get 'movie/:id/spam' => "movies#spam", :as => "spam_mail"

  get 'rental/show/:id' => "rental#show", :as => 'rental_show'

  devise_for :users
  # to remove querry string in url bcz it is not search engine friendly
  resources :movies do
    get 'page/:page', :action => :index , :on => :collection
    resources :comments
    # so one movie have many comments
  end
  get 'person/index'

  #created 8 diff routs for crud so we comment products page route line
  resources :products
  get 'home'          => "page#home"

  get 'about_us'      => "page#about_us"

 # get 'products'      => "page#products"

 # get 'contact_us'    => "page#contact_us"

 # post 'contact_us'    => "page#contact_us"

  #Or both with

  match 'contact_us'    => "page#contact_us" ,:via => [:post , :get]

  get 'newsletter'    => "page#newsletter"

  get 'blog'          => "page#blog"

  get 'calendar(/:year(/:month))' => "page#calendar", :as => "calendar"

  get 'articles'      => "page#articles"

  get '/users/sign_in'         => "page#login"

  get '/users/sign_out'         => "page#sign_out"

  get 'dave_teacher/teach'

  get 'dave_teacher/speak'

  get 'dave_teacher/dig'

  get 'say/tahir' => 'say#hello'
  get 'say/goodbye'
  get 'say/something'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#home'

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
  #     #     resources :sales do
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
  #     #   end
end
