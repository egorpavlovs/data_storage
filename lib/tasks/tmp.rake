namespace :tmp do

  BASE_URL = 'https://pavlov-data-storage.herokuapp.com/'
  desc "Get one news item"
  task search_news_item: :environment do
    conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    req = {search_field: "Bendable"}
    resp = conn.post "/api/search_news_item", req
    pp JSON.parse(resp.body)

    puts "Done."

  end

  desc "Get all news items"
  task all_news_item: :environment do
    conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    resp = conn.get "/api/all_news_item"
    pp JSON.parse(resp.body)

    puts "Done."

  end

end