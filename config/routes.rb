Rails.application.routes.draw do
  scope :api, default: {format: :json} do 
    resources :foos, except: [:new, :edit]
  end
end
