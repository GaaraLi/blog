Blog::Application.routes.draw do
  resources :articles

  root "page#homepage"

  get "cv" => "page#CV"
  match '*path', via: :all, to:'page#error_404'
end
