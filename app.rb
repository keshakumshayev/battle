require 'sinatra'
require 'shotgun'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb(:player_names)
  end

  post '/names' do
    p1 = Player.new(params[:p1])
    p2 = Player.new(params[:p2])
    $game = Game.new(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    params[:p2hp] = @game.p2.hp
    @p2hp = params[:p2hp]
    erb(:ready)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.p2)
    params[:p2hp] = @game.p2.hp
    @p2hp = params[:p2hp]
    erb(:attack)
  end

  run! if app_file == $0
end
