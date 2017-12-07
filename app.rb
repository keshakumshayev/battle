require 'sinatra'
require 'shotgun'
require './lib/player'

class Battle < Sinatra::Base


  get '/' do
    erb(:player_names)
  end

  get '/battle' do
    params[:p2hp] = $p2.hp
    @p2hp = params[:p2hp]
    erb(:ready)
  end

  get '/attack' do
    erb(:attack)
  end

  post '/players' do
    $p1 = Player.new(params[:p1])
    $p2 = Player.new(params[:p2])
    params[:p2]
    redirect '/battle'
  end

  run! if app_file == $0
end
