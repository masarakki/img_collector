ImageCollector::Application.routes.draw do
  resources :board_threads, :only => [:index, :create, :show, :destroy] do
    get :queue, :on => :member
  end

  root :to => 'board_threads#index'

end
