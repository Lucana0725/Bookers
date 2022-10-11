Rails.application.routes.draw do
  # get 'books/new'
  # # get 'books/index'
  # get 'books' => 'books#index'
  # get 'books/show'
  # get 'books/edit'
  get '/' => 'homes#top'
  resources :books
  
  # 【補足】getの後の''にはURLを、=>後の''にはアクション名が入る
  # get 'homes/top'
  # get 'top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
