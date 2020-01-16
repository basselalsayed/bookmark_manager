require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    p params
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end

  run! if app_file ==$0
end
