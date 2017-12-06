require 'sinatra'
require 'shotgun'


class Battle < Sinatra::Base
  enable :sessions

  get '/first_test' do
    'Testing infrastructure working!'
  end

  get '/' do
    erb(:player_names)
  end

  get '/battle' do
    @p1 = session[:p1]
    @p2 = session[:p2]
    "#{@p1} VS #{@p2}"
  end

  post '/players' do
    session[:p1] = params[:p1]
    session[:p2] = params[:p2]
    redirect '/battle'
  end

  run! if app_file == $0
end
