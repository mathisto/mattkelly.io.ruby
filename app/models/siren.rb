# frozen_string_literal: true

# Fire and EMS entries contain a "Incident Sub-Type" field that Traffic does not.
# Let's build a little parser for the "description" values to make it easier.
# We can just use the same data structure for both varieties, but "Incident [Sub-Type"
# will be `nil` for EMS and Fire.

class Siren < ActiveRecord::Base
  validates_presence_of :title, :category, :incident_type, :incident_location, :municipality

  attr_accessor :description, :title, :category, :incident_type, :incident_location,
                :municipality, :created_at, :station

  def initialize(alarm)
    @description = alarm.description
    category_title = alarm.title
    @category, @title = category_title.split(': ')

    case @category
    in ['FIRE', 'EMS']
      @incident_location, @municipality, @station, @created_at = @description.split(/;\ */)
    in ['TRAFFIC']
      @incident_location, @municipality, @created_at = @description.split(/;\ */)
      @title = @title.chomp(' -')
    end
  end

  def to_h
    { category: @category,
      title: @title,
      incident_type: @incident_type,
      incident_location: @incident_location,
      municipality: @municipality,
      created_at: @created_at,
      station: @station }
  end
end
