module Airtable
    class FetchDataOnLoad < ApplicationService
        def self.call(...)
          new(...).call
        end

        def initialize()
          @response = {}
        end

        def call
          get_response
        end

        private

				def get_response
					response = HTTParty.get("https://api.airtable.com/v0/appuVsBXIZ6Ng5hqC/Table%201?api_key=keyxb0pMxFICFI2lS")
					JSON.parse(response.body)
				end
    end
end
