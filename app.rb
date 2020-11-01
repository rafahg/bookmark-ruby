require 'sinatra/base'

class BookmarkManager < Sinatra::Base 
  get '/' do 
    'Bookmark Manager'
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index' # view
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new' # view
  end
  run! if app_file == $0
end
