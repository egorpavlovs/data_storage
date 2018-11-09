class BaseApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_news_item

  def show
    render json: @news_items
  end

  private

    def find_news_item
      @news_items = NewsItem.where("news_items.title ilike ?", "%#{params["search_field"]}%")
    end

end
