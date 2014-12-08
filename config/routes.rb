Blog::Application.routes.draw do
  resources :tags
  resources :articles do
    get :preview, on: :member
  end

  root "page#homepage"

  namespace :admin do
    resources :tags
    resources :articles
  end

  # api
  get 'subtitle' => "page#change_subtitle"
  get 'ab_test' => 'page#ab_test'
  get 'mortal' => 'page#mortal'

  # static
  get "cv" => "page#CV"
  get "cv-en" => "page#CV_en"

  # errors
  match '*', via: :all, to:'page#error_404'
end
