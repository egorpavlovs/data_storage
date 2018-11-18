class ApiController < ApplicationController
   skip_before_action :verify_authenticity_token, only: %i(show)

  def show
    news_item = NewsItemService.search(params["search_field"])
    render json: news_item
  end

  def index
    render json: NewsItem.all
  end

end
