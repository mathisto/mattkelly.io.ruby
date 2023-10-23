# frozen_string_literal: true

# Fire and EMS entries contain a "Incident Sub-Type" field that Traffic does not.
# Let's build a little parser for the "description" values to make it easier.
# We can just use the same data structure for both varieties, but "Incident [Sub-Type"
# will be `nil` for EMS and Fire.

class Siren < ActiveRecord::Base
  validates_presence_of :category, :incident_type, :incident_location, :municipality

  # def to_h
  #   { category: @category,
  #     incident_type: @incident_type,
  #     incident_location: @incident_location,
  #     municipality: @municipality,
  #     created_at: @created_at,
  #     station: @station }
  # end
end
