class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    render json: NewsItem.where("news_items.title ilike ?", "%#{params["search_field"]}%")
  end

  def index
    render json: NewsItem.all
  end

end
