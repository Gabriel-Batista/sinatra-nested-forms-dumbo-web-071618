require './environment'

module FormsLab
  class App < Sinatra::Base
    set :views, Proc.new { File.join(root, "views/pirates") }

    get '/' do
      erb :index
    end
    
    get '/new' do
      erb :new
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      params[:pirate][:ships].each do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      @ships = Ship.all
      erb :show
    end

  end
end
