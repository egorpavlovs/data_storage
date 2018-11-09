class BaseApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :parse_request, :find_news_item

  def show
    render json: @news_items
  end

  private

    def parse_request
      pp ["params", params]
      pp ["params[search_field]", params["search_field"]]
      pp ["JSON.parse(params[search_field])", JSON.parse(params["search_field"])]
      pp ["JSON.parse(params)", JSON.parse(params)]
      @json = JSON.parse(params[:search_field])
    end

    def find_news_item
      @news_items = NewsItem.where("news_items.title ilike ?", "%#{@json["search_field"]}%")
    end

end
