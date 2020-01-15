require 'sinatra/base'
require './lib/user_bookmarks'

class BookmarkManager < Sinatra::Base

  before do 
    @bookmarks = Bookmarks.instance
  end

  get '/' do
    erb :'bookmarks/index'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.create("plato")
    erb :'bookmarks/bookmarks'
  end

  run! if app_file ==$0
end