module Airtable
  class FetchUpdatedCopies < ApplicationService
    def self.call(...)
      new(...).call
    end

    def initialize(timestamp)
      @timestamp = timestamp
    end

    def call
      Airtable::FetchDataOnLoad.call
      load_updated_copies
      changes_after_timestamp.to_json
    end

    private

    attr_reader :timestamp, :copy

    def load_updated_copies
      path = Rails.root.join('tmp', 'copy.json')
      @copy = JSON.parse(File.read(path))
    end

    def changes_after_timestamp
      copy['records'].select do |record|
        formate_record_datetime(record) > timestamp.to_i
      end
    end

    def formate_record_datetime(record)
      Time.parse(record['fields']['Last Modified']).to_i
    end
  end
end
