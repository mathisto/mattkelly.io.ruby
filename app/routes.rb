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
    @siren = Siren.all
  end

  get '/sirens/:id' do
    @siren = Siren.find(params[:id])
  end

  post '/sirens' do
    @siren = Siren.create(params[:siren])
  end

  delete '/sirens/:id' do
    Siren.destroy(params[:id])
  end

  put '/sirens/:id/publish' do
    @siren = Siren.find(params[:id])
    @siren.publish!
  end
end
