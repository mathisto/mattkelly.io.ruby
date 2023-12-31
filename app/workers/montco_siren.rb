# frozen_string_literal: true

require "sidekiq-scheduler"
require "rss"
require "httpx"
require "active_record"
require "sinatra/activerecord"
require "amazing_print"
require_relative "../models/siren"

URL = "https://webapp07.montcopa.org/eoc/cadinfo/livecadrss.asp"

class MontcoSirenWorker
  include Sidekiq::Worker

  def perform
    rss = RSS::Parser.parse(HTTPX.get(URL).to_s)
    rss.items.each do |item|
      item_hash = parse(item)
      # Siren.where() TODO: Add a where(unique_conds).first_or_create
      Siren.create(item_hash)
    end
  end

  private

  def parse(item)
    description = item.description
    category_and_title = item.title
    category, incident_type = category_and_title.split(": ")
    dispatched_at = item.pubDate.to_datetime
    incident_location, municipality, station, created_at = description.split(/;\ */)

    case category
    when "Fire"
      # Was oddly formatted like this:
      # "station", "2023-10-29 @ 20:26:10-Station:STA18"
      station = station.split(":").last
    when "Traffic"
      # Had this weird trailing hyphen:
      incident_type = incident_type.chomp(" -")
    else
    end

    {category:, incident_type:, incident_location:, municipality:, created_at:, station:, dispatched_at:}
  end
end
