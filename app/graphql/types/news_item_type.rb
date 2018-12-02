module Types
  class NewsItemType < Types::BaseObject
    graphql_name 'NewsItem'
    field :id, Integer, null: false
    field :title, String, null: false
    # field :description, Text, null: false
    # field :content, String, null: false
    field :author, String, null: false
    # field :published_at, DateTime, null: false
    field :url, String, null: false
    field :url_to_image, String, null: false
  end
end

