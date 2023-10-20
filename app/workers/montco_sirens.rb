# frozen_string_literal: true

require 'sidekiq-scheduler'
require 'rss'
require 'open-uri'
require 'app/models/alarm'

URL = 'https://webapp07.montcopa.org/eoc/cadinfo/livecadrss.asp'

module Workers
  class MontcoSirens
    include Sidekiq::Worker

    def perform
      # Let's slurp that feed into a collection
      feed = URI.open(URL) { |rss| RSS::Parser.parse(rss) }
      all_items(feed).each do |item|
      end
    end
  end
end

  private

def all_items(feed)
  # Now we can tap-build and array with all the feed items as neat little hashes and return it
  [].tap do |arr|
    feed.items.each do |alarm|
      arr << { title: alarm.title,
               description: alarm.description,
               created_at: alarm.pubDate }
    end
  end
end
