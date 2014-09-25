Blog::Application.routes.draw do
  resources :articles, path:'blog'

  root "page#homepage"

  match '*path', via: :all, to:'page#error_404'
end
