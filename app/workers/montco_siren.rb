# frozen_string_literal: true

require 'sidekiq-scheduler'
require 'rss'
require 'open-uri'
require 'active_record'
require 'sinatra/activerecord'
require 'amazing_print'
require_relative '../models/siren'

URL = 'https://webapp07.montcopa.org/eoc/cadinfo/livecadrss.asp'

  class MontcoSirenWorker
    include Sidekiq::Worker

    def perform
      # Let's slurp that feed into a collection
      feed = URI.open(URL) { |rss| RSS::Parser.parse(rss) }
      feed.items.each do |item|
        Siren.create(parse(item))
      end
    end

    private

    def parse(item)
      description = item.description
      category_and_title = item.title
      category, incident_type = category_and_title.split(': ')
      dispatched_at = item.pubDate.to_datetime

      case category
      when 'Fire', 'EMS'
        incident_location, municipality, station, created_at = description.split(/;\ */)
      when 'Traffic'
        incident_location, municipality, created_at = description.split(/;\ */)
        incident_type = incident_type.chomp(' -')
      else
        puts "NO MATCHING CATEGORY FOUND: #{category}"
      end

      { category:, incident_type:, incident_location:, municipality:, created_at:, station:, dispatched_at: }
    end
  end
