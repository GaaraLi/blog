Blog::Application.routes.draw do
  resources :articles

  root "page#homepage"
  get 'subtitle' => "page#change_subtitle"

  get "cv" => "page#CV"

  match '*path', via: :all, to:'page#error_404'
end
