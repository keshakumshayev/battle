require 'sinatra'
require 'shotgun'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'yes'

  get '/' do
    erb(:player_names)
  end

  post '/names' do
    session[:p1] = params[:p1]
    session[:p2] = params[:p2]
    p1 = Player.new(session[:p1])
    p2 = Player.new(session[:p2])
    $game = Game.new(p1,p2)
    session[:game] = $game
    redirect '/play'
  end

  get '/play' do
    @game = session[:game]
    params[:p2hp] = @game.p2.hp
    @p2hp = params[:p2hp]
    erb(:ready)
  end

  get '/attack' do
    @game = session[:game]
    @game.attack(@game.p2)
    params[:p2hp] = @game.p2.hp
    @p2hp = params[:p2hp]
    erb(:attack)
  end

  run! if app_file == $0
end
