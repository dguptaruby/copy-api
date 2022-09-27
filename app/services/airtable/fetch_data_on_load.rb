module Airtable
  class FetchDataOnLoad < ApplicationService
    def self.call(...)
      new(...).call
    end

    def initialize
      @response = {}
    end

    def call
      path = Rails.root.join('tmp', 'copy.json')
      File.write(path, response)
    end

    private

    def response
      response = HTTParty.get('https://api.airtable.com/v0/appuVsBXIZ6Ng5hqC/Table%201?api_key=keyxb0pMxFICFI2lS')
      JSON.parse(response.body).to_json
    end
  end
end
