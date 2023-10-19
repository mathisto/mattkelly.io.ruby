# frozen_string_literal: true

require 'sidekiq-scheduler'

class MontcoSirens
  include Sidekiq::Worker

  def perform
    puts 'Hello Sirens!'
  end
end
