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

  # Montco Sirens - Local Montgomery County PA WebCAD aggregation and enrichment
  get    '/sirens'     { @siren = Siren.all }
  get    '/sirens/:id' { @siren = Siren.find(params[:id]) }
  post   '/sirens'     { @siren = Siren.create(params[:siren]) }
  delete '/sirens/:id' { Siren.destroy(params[:id]) }
  put    '/sirens/:id/publish' do
    @siren = Siren.find(params[:id])
    @siren.publish!
  end
end
