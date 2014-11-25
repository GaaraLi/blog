Blog::Application.routes.draw do
  resources :tags
  resources :articles

  root "page#homepage"

  namespace :admin do
    resources :tags
    resources :articles
  end

  #api
  get 'subtitle' => "page#change_subtitle"

  #static
  get "cv" => "page#CV"

  #errors
  match '*', via: :all, to:'page#error_404'
end
