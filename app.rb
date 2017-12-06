require 'sinatra'
require 'shotgun'


class Battle < Sinatra::Base
  get '/' do
    erb(:player_names)
  end

  run! if app_file == $0
end
