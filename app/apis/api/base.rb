require 'grape'
require 'grape-swagger'

module API
  class Base < Grape::API
    format :json
    default_format :json
    prefix 'api'

    included do
      def logger
        Rails.logger
      end
      
      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(message: e.message, status: 422)
      end
    end

    mount API::V1::Base
    mount API::Status
  end
end
