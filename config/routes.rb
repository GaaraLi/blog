Blog::Application.routes.draw do
  resources :articles

  root "page#homepage"
end
