module API
  class Status < Grape::API
    desc 'Get status information. This is a test endpoint to check if the api is working.'
      get '/status' do
        time = Time.now
        "is live: #{time}"
      end
  end
end
