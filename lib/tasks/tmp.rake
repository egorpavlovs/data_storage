namespace :tmp do

  desc "Use self api from heroku"
  task get_news: :environment do
    conn = Faraday.new(url: 'https://pavlov-data-storage.herokuapp.com/') do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    req = {search_field: "Bendable"}
    resp = conn.post "/api", req
    pp resp.body

    puts "Done."

  end

end