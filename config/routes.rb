Rails.application.routes.draw do
  root to: "rails_admin/main#dashboard"

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope '/api' do
    match '/search_news_item', to: 'api#show', via: :post
    match '/all_news_item', to: 'api#index', via: :get
  end
end
