class NewsItemService < ApplicationService
  class << self
    def search(search_field)
      words = search_field.split(/\W+/).map {|val| "%#{val}%" }
      NewsItem.where("title ilike any (array[:search]) or description ilike any (array[:search])", search: words)
    end
  end
end