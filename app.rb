require 'sinatra'
require 'shotgun'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:player_names)
  end

  get '/battle' do
    @p1 = session[:p1]
    @p2 = session[:p2]
    erb(:ready)
  end

  get '/attack' do
    @p1 = session[:p1]
    @p2 = session[:p2]
    "#{@p1} attacked #{@p2}"
  end

  post '/players' do
    session[:p1] = params[:p1]
    session[:p2] = params[:p2]
    redirect '/battle'
  end

  run! if app_file == $0
end
