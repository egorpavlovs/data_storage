Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "rails_admin/main#dashboard"

  scope '/api' do
    match '/search_news_item', to: 'api#show', via: :post
    match '/all_news_item', to: 'api#index', via: :get
  end
end
