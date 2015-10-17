require 'active_support/concern'
require 'httparty'
require 'provider_entity'

module Api
  module Base
    extend ActiveSupport::Concern

    included do
      include HTTParty
      format :json
      attr_reader :country_code
    end

    def initialize(country_code = 'us')
      @country_code = country_code
    end

    def clean_api_query_string(query)
      query.gsub(/(feat(uring|\.)?.*)|(\(|\))/, "").strip
    end
  end
end
