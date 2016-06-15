require 'grape'
require 'grape-swagger'

module API
  class Base < Grape::API
    format :json
    default_format :json
    prefix 'api'

    helpers do
      def logger
        Rails.logger
      end

      def server_error!(e)
        error!({ error: 'Server error.' }, 500, { 'Content-Type' => 'text/error' }, message: e.message)
      end
    end

    # rescue_from :all do |e|
    #   server_error!(e)
    # end

    mount API::V1::Base
    mount API::Status
    # add_swagger_documentation
  end
end
