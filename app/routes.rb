require 'sidekiq/web'
require 'sidekiq-scheduler/web'
require_relative 'models/siren'

class App < Sinatra::Base
  # Homepage/Root
  get '/' do
    markaby :index
  end

  # All API endpoints are namespaced under here
  get '/api' do
    content_type :json
    { params: }.to_json
  end

  ##############################################################################
  # Montco Sirens - Local Montgomery County PA WebCAD aggregation and enrichment
  get '/sirens' do
    @siren = ::Siren.all.to_json
  end

  get '/sirens/:id' do
    @siren = ::Siren.find(params[:id]).to_json
  end
end
