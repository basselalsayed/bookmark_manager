require 'sinatra/base'
require './lib/user_bookmarks'

class BookmarkManager < Sinatra::Base

  before do 
    @user_bookmarks = UserBookmarks.instance
  end

  get '/' do
    erb :'bookmarks/index'
  end

  get '/bookmarks' do
    @user_bookmarks = UserBookmarks.create('plato', ["www.google.com", "www.reddit.com", "www.bbc.co.uk"])
    erb :'bookmarks/bookmarks'
  end

  run! if app_file ==$0
end