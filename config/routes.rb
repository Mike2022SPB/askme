Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do
    patch :hide, on: :member
  end

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]

  get "questions/hashtag/:name", to: "questions#hashtags"
end
