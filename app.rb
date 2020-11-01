require 'sinatra/base'
require'./lib/bookmark.rb'

class BookmarkManager < Sinatra::Base 

  enable :sessions, :method_override

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

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
    redirect '/bookmarks'
  end 

  delete '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']};")
    redirect '/bookmarks'
  end
  run! if app_file == $0
end
