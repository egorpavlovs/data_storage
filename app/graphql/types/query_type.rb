module Types
  class QueryType < Types::BaseObject
    graphql_name 'Query'
    field :news_items, NewsItemType, null: false

    def news_items
      NewsItem.all
    end
  end
end
