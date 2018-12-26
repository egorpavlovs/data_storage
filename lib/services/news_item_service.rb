class NewsItemService < ApplicationService
  class << self
    def search(search_field)
      pp ['search_field', search_field]
      line_search = NewsItem.where("news_items.title ilike ?", "%#{search_field}%")
      unless line_search.present?
        words = search_field.split(/\W+/).map {|val| "%#{val}%" }
        line_search = NewsItem.where("title ilike any (array[:search]) or description ilike any (array[:search])", search: words)
      end
      line_search
    end
  end
end