Rails.application.routes.draw do
  get 'monthly/index'

  get 'monthly/view'

  get 'correlation/index'

  get 'correlation/view'

  post 'correlation/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
