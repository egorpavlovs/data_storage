class BaseApiController < ApplicationController
  before_action :parse_request, :find_news_item

  def show
    render json: @news_items
  end

  private

    def parse_request
      @json = JSON.parse(request.body.read)
    end

    def find_news_item
      @news_items = NewsItem.where("news_items.title ilike ?", "%#{@json["search_field"]}%")
    end

end
