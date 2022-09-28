module Airtable
  class FetchDataOnLoad < ApplicationService
    def self.call(...)
      new(...).call
    end

    def initialize
      @api_key = Rails.application.credentials[:airtable][:api_key]
    end

    def call
      path = Rails.root.join('tmp', 'copy.json')
      File.write(path, response)
    end

    private

    attr_reader :api_key

    def response
      response = HTTParty.get("#{AIRTABLE_BASE_URL}?api_key=#{api_key}")
      JSON.parse(response.body).to_json
    end
  end
end
